import 'package:chopper_app_complete/bloc/addpost_bloc.dart';
import 'package:chopper_app_complete/bloc/post_bloc.dart';
import 'package:chopper_app_complete/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Chopper App',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<DemolistBloc>(
            create: (BuildContext context) => DemolistBloc(),
          ),
          BlocProvider<AddpostsBloc>(
            create: (BuildContext context) => AddpostsBloc(),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
