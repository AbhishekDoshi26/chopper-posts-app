import 'package:chopper_app_complete/bloc/post_event.dart';
import 'package:chopper_app_complete/bloc/post_state.dart';
import 'package:chopper_app_complete/bloc/post_bloc.dart';
import 'package:chopper_app_complete/model/constants.dart';
import 'package:chopper_app_complete/model/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chopper_app_complete/bloc/addpost_state.dart';

import 'buildPosts.dart';

class Postwidget extends StatefulWidget {
  @override
  _PostwidgetState createState() => _PostwidgetState();
}

class _PostwidgetState extends State<Postwidget> {
  DemolistBloc demolistBloc;
  List<bool> isSelected = [true, false];
  List<FocusNode> focusToggle;
  FocusNode focusNodeButton1 = FocusNode();
  FocusNode focusNodeButton2 = FocusNode();
  List<BuiltPost> postlist = List();
  List<BuiltPost> filteredposts = List();
  bool isGrid = false;

  @override
  void initState() {
    demolistBloc = BlocProvider.of<DemolistBloc>(context);
    demolistBloc.add(GetDemoList());
    focusToggle = [focusNodeButton1, focusNodeButton2];
    super.initState();
  }

  @override
  void dispose() {
    // demolistBloc.close();
    focusNodeButton1.dispose();
    focusNodeButton2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          ScreenTitle.kPostsApp,
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
        actions: <Widget>[
          Switch(
            value: isGrid,
            onChanged: (value) {
              setState(() {
                isGrid = value;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              style: TextStyle(color: Colors.black, fontSize: 20.0),
              decoration: InputDecoration(
                fillColor: Colors.white70,
                filled: true,
                hintText: 'Enter search phrase',
                hintStyle: TextStyle(color: Colors.black26),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
              onChanged: (string) {
                setState(() {
                  demolistBloc.add(GetFilteredDemoList(string));
                });
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<DemolistBloc, DemolistState>(
              builder: (context, state) {
                print('state $state');
                if (state is DemolistInitial || state is DemoListLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is DemoListLoaded) {
                  postlist = state.postlists;
                  print(postlist.length);
                  return isGrid
                      ? GridView.builder(
                          itemCount: postlist.length,
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemBuilder: (context, index) =>
                              buildPosts(postlist[index], isGrid, context))
                      : ListView.separated(
                          itemCount: postlist.length,
                          itemBuilder: (context, index) =>
                              buildPosts(postlist[index], isGrid, context),
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider();
                          },
                        );
                } else if (state is Demolistfiltered) {
                  postlist = state.filteredposts;
                  print(postlist.length);
                  return isGrid
                      ? GridView.builder(
                          itemCount: postlist.length,
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemBuilder: (context, index) =>
                              buildPosts(postlist[index], isGrid, context),
                        )
                      : ListView.builder(
                          itemCount: postlist.length,
                          itemBuilder: (context, index) =>
                              buildPosts(postlist[index], isGrid, context),
                        );
                } else if (state is Errorpost) {
                  return Center(
                    child: Text(GeneralString.kError),
                  );
                }

                return Container(
                  child: Text(GeneralString.kWait),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
