import 'package:flutter/material.dart';
import 'splash.dart';
import 'ui/colors.dart';


void main() => runApp(PPQuiz());

class PPQuiz extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PPQuiz",
      theme: ThemeData(
        primaryColor: QuizColors.primary.color,
        accentColor: QuizColors.secondary.color
      ),
      home: SplashScreen()
    );
  }
}