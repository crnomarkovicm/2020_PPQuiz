import 'dart:convert';
import 'package:ppquiz/koznazna_score.dart';

import 'ui/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:math';

class ko_zna_zna extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/koznazna.json"),
      builder: (context, snapshot){

        List mydata = json.decode(snapshot.data.toString());
        if(mydata == null){
          return Scaffold(
            body: Center(
              child: Text(
                "Loading...",
                style: TextStyle(
                  color: QuizColors.text2.color,
                ),
              ),
            ),
          );
        }
        else{
          return koznazna(mydata : mydata);
        }
      },
    );
  }
}

class koznazna extends StatefulWidget {

  var mydata;

  koznazna({Key key, @required this.mydata}) : super(key : key);

  @override
  _koznaznaState createState() => _koznaznaState(mydata);
}

class _koznaznaState extends State<koznazna> {

  var mydata;
  _koznaznaState(this.mydata);

  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  int j = 0;
  int timer = 10;
  String showtimer = "10";

  Map<String, Color> btncolor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent,
  };

  var rng = new Random();
  List<int> lista = [];

  bool canceltimer = false;

  @override
  void initState(){
    j = rng.nextInt(11);
    while(j == 0)
      j = rng.nextInt(11);
    lista.add(j);
    starttimer();
    super.initState();
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t){
      setState(() {
        if(timer < 1){
          t.cancel();
          nextquestion();
        }
        else if(canceltimer){
          t.cancel();
        }
        else{
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion(){
    canceltimer = false;
    timer = 10;
    setState(() {
      if(i < 10) {
        i++;
        j = rng.nextInt(11);
        while(lista.indexOf(j) != -1 || j == 0){
          j = rng.nextInt(11);
        }

        lista.add(j);
      }
      else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => koznazna_score(marks: marks),
        ));
      }
      btncolor["a"] = Colors.indigoAccent;
      btncolor["b"] = Colors.indigoAccent;
      btncolor["c"] = Colors.indigoAccent;
      btncolor["d"] = Colors.indigoAccent;
    });
    starttimer();
  }

  void checkanswer(String k){
    if(mydata[2][j.toString()] == mydata[1][j.toString()][k]){
      marks = marks + 5;
      colortoshow = right;
    }
    else{
      colortoshow = wrong;
      marks = marks - 1;
    }
    setState(() {
      btncolor[k] = colortoshow;
      canceltimer = true;
    });

    Timer(Duration(seconds: 2), nextquestion);
  }

  Widget choicebutton(String k){
    if(!canceltimer) {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        child: MaterialButton(
            onPressed: () => checkanswer(k),
            child: Text(
              mydata[1][j.toString()][k],
              style: Theme
                  .of(context)
                  .textTheme
                  .display2,
            ),
            color: btncolor[k],
            splashColor: QuizColors.secondary.color,
            highlightColor: Colors.indigo[700],
            minWidth: 200.0,
            height: 45.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))
        ),
      );
    }
    else{
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        child: MaterialButton(
            onPressed: () {},
            child: Text(
              mydata[1][j.toString()][k],
              style: Theme
                  .of(context)
                  .textTheme
                  .display2,
            ),
            color: btncolor[k],
            splashColor: QuizColors.secondary.color,
            highlightColor: Colors.indigo[700],
            minWidth: 200.0,
            height: 45.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "PPQuiz",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            content: Text(
              "Da li ste sigurni da zelite da izadjete iz aplikacije dok je igra 'Ko zna zna' u toku?",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Ne',
                ),
              ),
              FlatButton(

                child: Text(
                  'Da',
                ),
                onPressed: () {
                  exit(0);
                },
              ),
            ],
          )
        );
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child:  Text(
                  mydata[0][j.toString()],
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choicebutton('a'),
                    choicebutton('b'),
                    choicebutton('c'),
                    choicebutton('d'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Center(
                  child: Text(
                      showtimer,
                      style: Theme.of(context).textTheme.display3
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}