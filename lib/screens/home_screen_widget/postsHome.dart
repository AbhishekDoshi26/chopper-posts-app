import 'package:chopper_app_complete/model/constants.dart';
import 'package:chopper_app_complete/model/posts.dart';
import 'package:chopper_app_complete/screens/home_screen_widget/dialog.dart';
import 'package:flutter/material.dart';

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
