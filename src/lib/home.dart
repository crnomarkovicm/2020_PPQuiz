import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
