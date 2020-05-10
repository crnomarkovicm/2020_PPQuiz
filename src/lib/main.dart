import 'package:flutter/material.dart';
import 'package:ppquiz/theme.dart';
import 'package:provider/provider.dart';
import 'splash.dart';
import 'ui/colors.dart';
import 'package:ppquiz/home.dart';

//import 'package:google_fonts/google_fonts.dart';


void main() => runApp(PPQuiz());

class PPQuiz extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: new MaterialAppTheme()
    );
  }
}

class MaterialAppTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "PPQuiz",
        themeMode: theme.getTheme() == ThemeData.dark()? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData(
            fontFamily: "Sen",
            primaryColor: QuizColors.primary.color,
            accentColor: QuizColors.secondary.color,
            cursorColor: QuizColors.primary.color,
            backgroundColor: QuizColors.background.color,
            buttonColor: QuizColors.button.color,
            brightness: Brightness.light,
            textTheme: TextTheme(
              display3: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w700,
                color: QuizColors.text2.color,
              ),
              headline: TextStyle(
                  fontSize: 30,
                  color: QuizColors.text.color
              ),
              title: TextStyle(
                  fontSize: 50,
                  color: QuizColors.text.color,
                  fontWeight: FontWeight.bold
              ),
              body1: TextStyle(
                  color: QuizColors.text.color,
                  fontSize: 21
              ),
              button: TextStyle(
                  color: QuizColors.text.color,
                  fontSize: 21
              ),
              subhead: TextStyle(
                  color: QuizColors.text.color,
                  fontSize: 24
              ),
              display2: TextStyle(
                  color: QuizColors.text.color,
                  fontSize: 16.0
              ),
              overline: TextStyle(
                  color: QuizColors.text.color,
                  fontSize: 16
              ),
              display1: TextStyle(
                fontSize: 24.0,
                color: QuizColors.text2.color,
              ),
            )
        ),
        darkTheme: ThemeData(
            fontFamily: "Sen",
            primaryColor: QuizColors.darkPrimary.color,
            accentColor: QuizColors.darkSecondary.color,
            cursorColor: QuizColors.darkPrimary.color,
            backgroundColor: QuizColors.darkBackground.color,
            brightness: Brightness.dark,
            textTheme: TextTheme(
                headline: TextStyle(
                fontSize: 30,
                    color: QuizColors.text.color
                ),
                body1: TextStyle(
                    color: QuizColors.text.color,
                    fontSize: 21
                ),
                subhead: TextStyle(
                    color: QuizColors.text.color,
                    fontSize: 24
                ),
                body2: TextStyle(
                    color: QuizColors.text.color,
                    fontSize: 16
                ),
                display1: TextStyle(
                  fontSize: 24.0,
                  color: QuizColors.text2.color,
                ),
                display2: TextStyle(
                  fontSize: 16.0,
                  color: QuizColors.text.color,
                ),
               title: TextStyle(
               fontSize: 50,
               color: QuizColors.text.color,
                  fontWeight: FontWeight.bold
            )
            )
        ),
        home: SplashScreen()
    );
  }

}