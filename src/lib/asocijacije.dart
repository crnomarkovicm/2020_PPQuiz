import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flip_card/flip_card.dart';
import 'ui/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppquiz/home.dart';
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

  int kol_score = 0;
  int konacno_score = 30;
  var rnd = new Random();
  int i = 0;
  int timer = 120;
  String show_timer = "120";


  @override
  void initState(){
    i = rnd.nextInt(3);
    starttimer();
    super.initState();
  }

  void starttimer() async {
    const sec = Duration(seconds: 1);
    Timer.periodic(sec, (Timer t){
      setState((){
        if(timer < 1){
          t.cancel();
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => homepage()));

        }
        else{
          timer = timer - 1;
        }
        show_timer = timer.toString();
      });
    });
  }


  Widget polje(kolona,oznaka){
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 5.0,
          ),
          child: Material (
            elevation: 5.0,
            borderRadius:  BorderRadius.circular(100.00),
            child: Container(
              child: Text(
                kolona+oznaka,
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
            vertical: 5.0,
            horizontal: 3.0,
          ),
          child: Material (
            elevation: 5.0,
            borderRadius:  BorderRadius.circular(100.00),
            child: Container(
              child: Text(
                mydata[i][kolona][oznaka].toString(),
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

  @override
  void dispose(){
    _textFieldController.dispose();
    super.dispose();
  }

  void povecaj_score(){
    kol_score = kol_score - 5;
    konacno_score = konacno_score + 2;
  }


  Widget kolonaG(ind_kolone){
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 3.0,
          horizontal: 10.0,
        ),
        child: Container(
          child: Column(
            children: [
              polje(ind_kolone, "1"),
              polje(ind_kolone, "2"),
              polje(ind_kolone, "3"),
              polje(ind_kolone, "4"),
              MaterialButton(
                  onPressed: (){
                    return showDialog(
                        context: context,
                        builder:  (context) => AlertDialog(
                          title:Text("Unesite resenje kolone " + ind_kolone + ":",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15) ),
                          content: TextField(
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15
                            ),
                            controller: _textFieldController,
                          ),
                          actions: <Widget>[ FlatButton(
                            child: new Text('OK'),
                            onPressed: () {
                              var value = _textFieldController.text;
                              _textFieldController.clear();

                              if (value == mydata[i][ind_kolone]["5"]){
                                povecaj_score();
                                return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(
                                          "Tacno",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15
                                          ),
                                        ),
                                      );
                                    }
                                    );
                              }
                              else {
                                return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(
                                          "Netacno",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15
                                          ),
                                        ),
                                      );
                                    });
                              }
                              },
                          )
                          ],

                        )
                    );
                  },
                  child: Text(
                    "Resenje kolone "+ind_kolone,
                    style: Theme.of(context).textTheme.display2,
                  ),
                  color: QuizColors.secondary.color,
                  splashColor: QuizColors.secondary.color,
                  highlightColor: Colors.indigo[700],
                  minWidth: 200.0,
                  height: 37.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
              )
            ],
          ),
          width: 185.0,
          height: 285.0,
          color: QuizColors.primary.color ,
        )
    );
  }


  Widget kolonaD(ind_kolone){
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 3.0,
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
                          title:Text("Unesite resenje kolone " + ind_kolone + ":",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15) ),
                          content: TextField(
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15
                            ),
                            controller: _textFieldController,
                          ),
                          actions: <Widget>[ FlatButton(
                            child: new Text('OK'),
                            onPressed: () {
                              var value = _textFieldController.text;
                              _textFieldController.clear();

                              if (value == mydata[i][ind_kolone]["5"]){
                                povecaj_score();
                                return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text("Tacno",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15
                                          ),),
                                      );
                                    });
                              }
                              else {
                                return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text("Netacno",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15
                                          ),),
                                      );
                                    });
                              }

                            },

                          )
                          ],

                        )
                    );
                  },
                  child: Text(
                    "Resenje kolone " + ind_kolone,
                    style: Theme.of(context).textTheme.display2,
                  ),
                  color: QuizColors.secondary.color,
                  splashColor: QuizColors.secondary.color,
                  highlightColor: Colors.indigo[700],
                  minWidth: 200.0,
                  height: 37.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
              ),
              polje(ind_kolone, "4"),
              polje(ind_kolone, "3"),
              polje(ind_kolone, "2"),
              polje(ind_kolone, "1"),
            ],
          ),
          width: 185.0,
          height: 285.0,
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
                  kolonaG('A'),
                  kolonaG('B'),
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
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15
                              ),
                              controller: _textFieldController,
                            ),
                          actions: <Widget>[ FlatButton(
                            child: new Text('OK'),
                      onPressed: () {

                        var value = _textFieldController.text;
                        _textFieldController.clear();

                        if (value == mydata[i]['E']) {

                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text((konacno_score + kol_score).toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15
                                    ),),
                                );
                              });
                        }
                        else {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text("Netacno",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15
                                    ),),
                                );
                              });
                        }
                      },

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
                  kolonaD('C'),
                  kolonaD('D'),
                ],
              ),
                  MaterialButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => homepage(),
                      ));
                    },
                    child:  Text(
                      show_timer+ " Napusti igru",
                      style: Theme.of(context).textTheme.display2,
                    ),
                      color: QuizColors.secondary.color,
                      splashColor: QuizColors.secondary.color,
                      highlightColor: Colors.indigo[700],
                      minWidth: 200.0,
                      height: 35.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                  )
            ]

        ),
        color: QuizColors.background.color,
      )
    );
  }
}