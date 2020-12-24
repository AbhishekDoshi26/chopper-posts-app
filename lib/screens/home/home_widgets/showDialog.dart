import 'package:chopper_app_complete/model/constants.dart';
import 'package:flutter/material.dart';

Future<void> showMyDialog(
    String title, String desc, BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                desc,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(GeneralString.kOk),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
