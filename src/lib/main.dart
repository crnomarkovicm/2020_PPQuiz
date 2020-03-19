import 'package:flutter/material.dart';
import 'splash.dart';
import 'ui/colors.dart';
//import 'package:google_fonts/google_fonts.dart';


void main() => runApp(PPQuiz());

class PPQuiz extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PPQuiz",
      theme: ThemeData(
        fontFamily: "Sen",
        primaryColor: QuizColors.primary.color,
        accentColor: QuizColors.secondary.color,
        cursorColor: QuizColors.primary.color,
        textTheme: TextTheme(
          headline: TextStyle(
            fontSize: 50,
            color: QuizColors.text.color,
            fontWeight: FontWeight.bold
          ),
          body1: TextStyle(
            color: QuizColors.text.color
          )
        )
      ),
      home: SplashScreen()
    );
  }
}