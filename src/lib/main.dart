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
        backgroundColor: QuizColors.background.color,
        textTheme: TextTheme(
          display1: TextStyle(
            fontSize: 30,
            color: QuizColors.text.color
          ),
          headline: TextStyle(
            fontSize: 50,
            color: QuizColors.text.color,
            fontWeight: FontWeight.bold
          ),
          body1: TextStyle(
            color: QuizColors.text.color,
            fontSize: 21
          ),
          subhead: TextStyle(
            color: QuizColors.text.color,
            fontSize: 24
          )
        )
      ),
      darkTheme: ThemeData(
          fontFamily: "Sen",
          primaryColor: QuizColors.darkPrimary.color,
          accentColor: QuizColors.darkSecondary.color,
          cursorColor: QuizColors.darkPrimary.color,
          backgroundColor: QuizColors.darkBackground.color,
          textTheme: TextTheme(
              headline: TextStyle(
                  fontSize: 50,
                  color: QuizColors.text.color,
                  fontWeight: FontWeight.bold
              ),
              body1: TextStyle(
                  color: QuizColors.text.color,
                  fontSize: 21
              ),
              subhead: TextStyle(
                  color: QuizColors.text.color,
                  fontSize: 24
              )
          )
      ),
      home: SplashScreen()
    );
  }
}