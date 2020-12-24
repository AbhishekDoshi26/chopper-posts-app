import 'package:chopper_app_complete/bloc/post_bloc.dart';
import 'package:chopper_app_complete/model/constants.dart';
import 'package:chopper_app_complete/model/posts.dart';
import 'package:flutter/material.dart';

class PostsData extends StatelessWidget {
  final PostLoadedState state;
  PostsData({this.state});
  @override
  Widget build(BuildContext context) {
    List<Posts> postlist = state.post.body.asList();
    return ListView.separated(
      itemBuilder: (context, index) => PostHome(
        postlist: postlist,
        index: index,
      ),
      separatorBuilder: (context, index) => Divider(
        thickness: 2.0,
        height: 40.0,
      ),
      itemCount: postlist.length,
    );
  }
}

class PostHome extends StatelessWidget {
  PostHome({
    this.postlist,
    this.index,
  });

  final List<Posts> postlist;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 20.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(30.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          onTap: () => showDialog(
            context: context,
            builder: (context) => DialogBox(
              index: index,
              postlist: postlist,
            ),
          ),
          leading: Text(
            'ID: ' + postlist[index].id.toString(),
            style: kHeadingStyle,
            textAlign: TextAlign.center,
          ),
          title: Expanded(
            child: Text(
              'Title: ' + postlist[index].title,
              style: kHeadingStyle,
            ),
          ),
        ),
      ),
    );
  }
}

class DialogBox extends StatelessWidget {
  DialogBox({
    this.postlist,
    this.index,
  });

  final List<Posts> postlist;
  final int index;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ID: ' + postlist[index].id.toString(),
            style: kHeadingStyle,
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Text(
              'Title: ' + postlist[index].title,
              style: kHeadingStyle,
            ),
          ),
        ],
      ),
      content: Expanded(
        child: Text(
          'Title: ' + postlist[index].body,
          style: kBodyStyle,
        ),
      ),
    );
  }
}
