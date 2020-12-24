import 'package:chopper_app_complete/model/posts.dart';
import 'package:flutter/material.dart';
import 'showDialog.dart';

Widget buildPosts(BuiltPost post, bool isGrid, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      elevation: 50,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: isGrid
            ? GestureDetector(
                onTap: () {
                  showMyDialog(post.title, post.body, context);
                },
                child: Center(
                  child: Text(
                    'Title:\n' + post.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              )
            : ListTile(
                title: Text(
                  post.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(post.body),
                ),
                onTap: () {
                  showMyDialog(post.title, post.body, context);
                },
              ),
      ),
    ),
  );
}
