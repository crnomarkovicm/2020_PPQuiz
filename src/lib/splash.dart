import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'ui/colors.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Home(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/pictures/pozadina1.jpg"),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            'PPQuiz',
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      )
    );
  }
}
