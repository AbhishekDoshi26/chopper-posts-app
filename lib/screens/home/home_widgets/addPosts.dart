import 'package:chopper_app_complete/bloc/addpost_bloc.dart';
import 'package:chopper_app_complete/bloc/addpost_state.dart';
import 'package:chopper_app_complete/bloc/addpost_event.dart';
import 'package:chopper_app_complete/model/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostWidget extends StatefulWidget {
  @override
  _AddPostWidgetState createState() => _AddPostWidgetState();
}

class _AddPostWidgetState extends State<AddPostWidget> {
  AddpostsBloc postBloc;
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  void initState() {
    postBloc = BlocProvider.of<AddpostsBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    postBloc.close();
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
          ScreenTitle.kaddPosts,
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: BlocListener<AddpostsBloc, AddpostsState>(
        listener: (context, state) {
          if (state is PostAdded)
            return Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.amber,
                content: Text('Post added!'),
              ),
            );
        },
        child: BlocBuilder<AddpostsBloc, AddpostsState>(
          builder: (context, state) {
            if (state is AddPostLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostAdded) {
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            state.res,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        onPressed: () {
                          postBloc.add(ResetPostPage());
                        },
                        child: const Text(ButtonText.kaddanotherPosts,
                            style: TextStyle(fontSize: 20)),
                      ),
                    ]),
              );
            } else if (state is AddpostsInitial) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                      decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: 'Enter Title',
                        hintStyle: TextStyle(color: Colors.black26),
                        prefixIcon: Icon(Icons.book),
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
                      controller: controller1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: controller2,
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                      decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: 'Enter Body',
                        hintStyle: TextStyle(color: Colors.black26),
                        prefixIcon: Icon(Icons.dashboard),
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50.0,
                      width: 200.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        onPressed: () {
                          postBloc.add(
                            Addpost(controller1.text.toString(),
                                controller2.text.toString()),
                          );
                        },
                        child: const Text(ButtonText.kaddPosts,
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
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
    );
  }
}
