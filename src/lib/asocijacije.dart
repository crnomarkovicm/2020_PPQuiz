import 'dart:convert';
import 'package:flip_card/flip_card.dart';

import 'ui/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class asocijacije extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/asocijacije.json"),
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
          return asoc(mydata : mydata);
        }
      },
    );
  }
}

class asoc extends StatefulWidget {

  var mydata;

  asoc({Key key, @required this.mydata}) : super(key : key);
  @override
  _asocState createState() => _asocState(mydata);
}

class _asocState extends State<asoc> {

  var mydata;
  _asocState(this.mydata);

  Widget polje(oznaka){
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front:  Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 5.0,
          ),
          child: Material (
            elevation: 5.0,
            borderRadius:  BorderRadius.circular(100.00),
            child: Container(
              child: Text(
                oznaka,
                style: Theme.of(context).textTheme.display2,
                textAlign: TextAlign.center,
              ),
              color: QuizColors.primary.color,
              width: 200.0,
              height: 40.0,
            ),

          )
      ),
      back:  Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 5.0,
          ),
          child: Material (
            elevation: 5.0,
            borderRadius:  BorderRadius.circular(100.00),
            child: Container(
              child: Text(
                mydata[1][oznaka[0]][oznaka[1]].toString(),
                style: Theme.of(context).textTheme.display2,
                textAlign: TextAlign.center,
              ),
              color: QuizColors.primary.color,
              width: 200.0,
              height: 40.0,
            ),
          )
      ),
    );

  }
  TextEditingController _textFieldController = TextEditingController();

  Widget kolonaA(){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: Container(
        child: Column(
          children: [
            polje("A1"),
            polje("A2"),
            polje("A3"),
            polje("A4"),
            MaterialButton(
                onPressed: (){
                  return showDialog(
                      context: context,
                      builder:  (context) => AlertDialog(
                          title:Text("Unesite resenje kolone A: ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15) ),
                          content: TextField(
                            controller: _textFieldController,
                          ),
                        actions: <Widget>[ FlatButton(
                          child: new Text('OK'),
                          onPressed: () {},

                        )
                        ],

                      )
                  );
                },
                child: Text(
                  "Resenje kolone A",
                  style: Theme.of(context).textTheme.display2,
                ),
                color: QuizColors.secondary.color,
                splashColor: QuizColors.secondary.color,
                highlightColor: Colors.indigo[700],
                minWidth: 200.0,
                height: 40.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
            )
          ],
        ),
        width: 185.0,
        height: 290.0,
        color: QuizColors.primary.color ,
    )
    );
  }
  Widget kolonaB(){
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        child: Container(
          child: Column(
            children: [
              polje("B1"),
              polje("B2"),
              polje("B3"),
              polje("B4"),
              MaterialButton(
                  onPressed: (){
                    return showDialog(
                        context: context,
                        builder:  (context) => AlertDialog(
                            title:Text("Unesite resenje kolone: B",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15) ),
                            content: TextField(
                              controller: _textFieldController,
                            ),
                          actions: <Widget>[ FlatButton(
                            child: new Text('OK'),
                            onPressed: () {},

                          )
                          ],

                        )
                    );
                  },
                  child: Text(
                    "Resenje kolone B",
                    style: Theme.of(context).textTheme.display2,
                  ),
                  color: QuizColors.secondary.color,
                  splashColor: QuizColors.secondary.color,
                  highlightColor: Colors.indigo[700],
                  minWidth: 200.0,
                  height: 40.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
              )
            ],
          ),
          width: 185.0,
          height: 290.0,
          color: QuizColors.primary.color ,
        )
    );
  }

  Widget kolonaC(){
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        child: Container(
          child: Column(
            children: [
              MaterialButton(
                  onPressed: (){
                    return showDialog(
                        context: context,
                        builder:  (context) => AlertDialog(
                            title:Text("Unesite resenje kolone C: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15) ),
                            content: TextField(
                              controller: _textFieldController,
                            ),
                          actions: <Widget>[ FlatButton(
                            child: new Text('OK'),
                            onPressed: () {},

                          )
                          ],

                        )
                    );
                  },
                  child: Text(
                    "Resenje kolone C",
                    style: Theme.of(context).textTheme.display2,
                  ),
                  color: QuizColors.secondary.color,
                  splashColor: QuizColors.secondary.color,
                  highlightColor: Colors.indigo[700],
                  minWidth: 200.0,
                  height: 40.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
              ),
              polje("C4"),
              polje("C3"),
              polje("C2"),
              polje("C1"),

            ],
          ),
          width: 185.0,
          height: 290.0,
          color: QuizColors.primary.color ,
        )
    );
  }
  Widget kolonaD(){
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        child: Container(
          child: Column(
            children: [
              MaterialButton(
                  onPressed: (){
                    return showDialog(
                        context: context,
                        builder:  (context) => AlertDialog(
                          title:Text("Unesite resenje kolone D: ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15) ),
                          content: TextField(
                            controller: _textFieldController,
                          ),
                          actions: <Widget>[ FlatButton(
                            child: new Text('OK'),
                            onPressed: () {},

                          )
                          ],

                        )
                        );
                  },
                  child: Text(
                    "Resenje kolone D",
                    style: Theme.of(context).textTheme.display2,
                  ),
                  color: QuizColors.secondary.color,
                  splashColor: QuizColors.secondary.color,
                  highlightColor: Colors.indigo[700],
                  minWidth: 200.0,
                  height: 40.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
              ),
              polje("D4"),
              polje("D3"),
              polje("D2"),
              polje("D1"),

            ],
          ),
          width: 185.0,
          height: 290.0,
          color: QuizColors.primary.color ,
        )
    );
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
                "Da li ste sigurni da zelite da izadjete iz aplikacije dok je igra 'Asocijacije' u toku?",
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
      child: Container(
        child: Column(
            children: [
              Row (
                children: <Widget>[
                  kolonaA(),
                  kolonaB(),
                ],
              ),
              MaterialButton(
                  onPressed: (){
                    return showDialog(
                        context: context,
                        builder:  (context) => AlertDialog(
                            title:Text("Unesite konacno resenje: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15) ),
                            content: TextField(
                              controller: _textFieldController,
                            ),
                          actions: <Widget>[ FlatButton(
                            child: new Text('OK'),
                      onPressed: () {},

                        )
                    ]));
                  },
                  child: Text(
                    "Konacno resenje",
                    style: Theme.of(context).textTheme.display2,
                  ),
                  color: QuizColors.secondary.color,
                  splashColor: QuizColors.secondary.color,
                  highlightColor: Colors.indigo[700],
                  minWidth: 300.0,
                  height: 40.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
              ),

              Row (
                children: <Widget>[
                  kolonaC(),
                  kolonaD(),
                ],
              ),


            ]

        ),
        color: QuizColors.background.color,
      )
    );
  }
}