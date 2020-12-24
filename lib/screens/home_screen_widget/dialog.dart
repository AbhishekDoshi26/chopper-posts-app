import 'package:chopper_app_complete/model/constants.dart';
import 'package:chopper_app_complete/model/posts.dart';
import 'package:flutter/material.dart';

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
