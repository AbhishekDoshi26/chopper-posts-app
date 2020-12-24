import 'package:chopper_app_complete/model/constants.dart';
import 'package:chopper_app_complete/screens/home/home_widgets/postWidget.dart';
import 'package:flutter/material.dart';
import 'home_widgets/addPosts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Postwidget(),
    AddPostWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: ScreenTitle.kpostsList,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.add),
            label: ScreenTitle.kaddPosts,
          )
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}
