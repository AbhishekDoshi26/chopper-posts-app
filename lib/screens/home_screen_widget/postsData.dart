import 'package:chopper_app_complete/bloc/post_bloc.dart';
import 'package:chopper_app_complete/model/constants.dart';
import 'package:chopper_app_complete/model/posts.dart';
import 'package:flutter/material.dart';

class PostsData extends StatelessWidget {
  final PostLoadedState state;
  final bool isGrid;
  PostsData({this.state, this.isGrid});
  @override
  Widget build(BuildContext context) {
    List<Posts> postlist = state.post.body.asList();
    return isGrid
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemBuilder: (context, index) => PostHome(
              postlist: postlist,
              index: index,
              isGrid: isGrid,
            ),
            itemCount: postlist.length,
          )
        : ListView.separated(
            itemBuilder: (context, index) => PostHome(
              postlist: postlist,
              index: index,
              isGrid: isGrid,
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
    this.isGrid,
  });

  final List<Posts> postlist;
  final int index;
  final bool isGrid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () => showDialog(
          context: context,
          builder: (context) => DialogBox(
            index: index,
            postlist: postlist,
          ),
        ),
        child: Card(
          elevation: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: isGrid
              ? Center(
                  child: Text(
                    'ID: ' + postlist[index].id.toString(),
                    style: kHeadingStyle,
                    textAlign: TextAlign.center,
                  ),
                )
              : ListTile(
                  contentPadding: EdgeInsets.all(30.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  leading: Text(
                    'ID: ' + postlist[index].id.toString(),
                    style: kHeadingStyle,
                    textAlign: TextAlign.center,
                  ),
                  title: Text(
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
          Flexible(
            child: Text(
              'Title: ' + postlist[index].title,
              style: kHeadingStyle,
            ),
          ),
        ],
      ),
      content: Text(
        'Body: ' + postlist[index].body,
        style: kBodyStyle,
      ),
    );
  }
}
