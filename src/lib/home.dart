import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          CupertinoIcons.mail
        ),
        centerTitle: true,
        title: Text(
          'PPQuiz',
          style: TextStyle(
            fontSize: 25.0
          ),
        ),
      )
    );
  }
}
