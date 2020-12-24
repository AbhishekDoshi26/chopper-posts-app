import 'package:chopper_app_complete/bloc/post_bloc.dart';
import 'package:chopper_app_complete/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: BlocProvider(
        create: (context) => PostBloc(),
        child: Home(),
      ),
      theme: ThemeData.dark(),
    );
  }
}
