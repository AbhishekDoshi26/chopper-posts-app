import 'package:chopper_app_complete/bloc/post_bloc.dart';
import 'package:chopper_app_complete/model/posts.dart';
import 'package:chopper_app_complete/screens/home_screen_widget/postsHome.dart';
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
