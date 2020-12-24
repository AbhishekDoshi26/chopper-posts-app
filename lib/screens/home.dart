import 'package:chopper_app_complete/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen_widget/postsData.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PostBloc postBloc;
  @override
  void initState() {
    postBloc = BlocProvider.of(context);
    postBloc.add(Fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Chopper Posts App',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 25.0,
          ),
        ),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (state is PostLoadedState)
            return PostsData(
              state: state,
            );
          return Container();
        },
      ),
    );
  }
}
