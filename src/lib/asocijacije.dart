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

  var myData;
  _asocState(this.myData);

  int kolScore = 4;
  int poljeScore = 16;
  int konacnoScore = 0;
  int score = 0;
  var rnd = new Random();
  int i = 0;
  int timer = 180;
  String showTimer = "180";
  bool krajIgre = false;

  bool pogodjenoA = false;
  bool pogodjenoB = false;
  bool pogodjenoC = false;
  bool pogodjenoD = false;



  @override
  void initState(){
    krajIgre = false;
    i = rnd.nextInt(4);
    print(i);
    startTimer();
    super.initState();

  }

  void startTimer() async {
    const sec = Duration(seconds: 1);
    Timer.periodic(sec, (Timer t){
      if (!mounted) return;
      setState((){
        if(krajIgre == true){
          t.cancel();
        }else if(timer < 1){
          score = konacnoScore + kolScore + poljeScore;
          t.cancel();
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  content: Container(
                      child:Column(
                          children: <Widget>[
                            Container(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(("Nazalost, vreme je isteklo :(\nVas score je: " + score.toString()),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                              width: 200.0,
                              height:200.0,),

                            MaterialButton(
                                onPressed: (){
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => asocijacije(),
                                  ));
                                },
                                child:  Text(
                                  "Igraj ponovo",
                                  style: Theme.of(context).textTheme.display2,
                                ),
                                color: QuizColors.secondary.color,
                                splashColor: QuizColors.secondary.color,
                                highlightColor: Colors.indigo[700],
                                minWidth: 200.0,
                                height: 50.0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                            )
                          ]
                      ),
                      width: 300.00,
                      height: 300.00,
                      color: QuizColors.primary.color),
                );
              });
        }
        else{
          timer = timer - 1;
          if(krajIgre == true)
            t.cancel();
        }
        showTimer = timer.toString();
      });
    });
  }


  Widget polje(kolona, oznaka){
    MediaQueryData deviceInfo = MediaQuery.of(context);
    var width = deviceInfo.size.width;
    var height = deviceInfo.size.height;

    return FlipCard(
      onFlip: (){
        poljeScore = poljeScore - 1;
      },
      direction: FlipDirection.HORIZONTAL,
      front: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 6.5,
            horizontal: 5.0,
          ),
          child: Material (
            elevation: 5.0,
            borderRadius:  BorderRadius.circular(100.00),
            child: Container(
              child: Align(
                  alignment: Alignment.center,
                child: Text(
                kolona+oznaka,
                style: Theme.of(context).textTheme.display2,
                textAlign: TextAlign.center,
              )
              ),
              color: QuizColors.primary.color,
              width: (width - 20.0)/2,
              height: (height - 130.0)/12,
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
              child: Align(
                alignment: Alignment.center,
                child:Text(
                myData[i][kolona][oznaka].toString(),
                style: Theme.of(context).textTheme.display2,
                textAlign: TextAlign.center,
              )
              ),
              color: QuizColors.primary.color,
              width: (width - 20.0)/2,
              height: (height - 130.0)/12,
            ),
          )
      ),
    );
  }

  TextEditingController _textFieldController = TextEditingController();


  void povecajScore(){
    kolScore = kolScore - 1;
    konacnoScore = konacnoScore + 10;
  }


  Widget kolonaG(indKolone){
    MediaQueryData deviceInfo = MediaQuery.of(context);
    var width = deviceInfo.size.width;
    var height = deviceInfo.size.height;

    String tekst;

    if(indKolone == "A"){
      if(pogodjenoA){
        tekst = myData[i]["A"]["r"];
      }
      else tekst = "Resenje kolone A" ;
    }
    if(indKolone == "B"){
      if(pogodjenoB){
        tekst = myData[i]["B"]["r"];
      }
      else tekst = "Resenje kolone B" ;
    }
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 5.0,
        ),
        child: Container(
          child: Column(
            children: [
              polje(indKolone, "1"),
              polje(indKolone, "2"),
              polje(indKolone, "3"),
              polje(indKolone, "4"),
              MaterialButton(
                  onPressed: (){
                    return showDialog(
                        context: context,
                        builder:  (context) => AlertDialog(
                          title:Text("Unesite resenje kolone " + indKolone + ":",
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

                              if (value == myData[i][indKolone]["r"]){
                                povecajScore();
                                if(indKolone == "A")
                                  pogodjenoA = true;
                                else pogodjenoB = true;
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
                              }},
                          )
                          ],

                        )
                    );
                  },
                  child: Text(
                    tekst,
                    style: Theme.of(context).textTheme.display2,
                      textAlign: TextAlign.center
                  ),
                  color: QuizColors.secondary.color,
                  splashColor: QuizColors.secondary.color,
                  highlightColor: Colors.indigo[700],
                  minWidth: (width - 20.0)/2,
                  height: (height - 130.0)/12,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
              )
            ],
          ),
          width: (width - 20.0)/2,
          height: (height - 110.0)/2,
          color: QuizColors.primary.color ,
        )
    );
  }


  Widget kolonaD(indKolone){
    MediaQueryData deviceInfo = MediaQuery.of(context);
    var width = deviceInfo.size.width;
    var height = deviceInfo.size.height;
    String tekst;

    if(indKolone == "C"){
      if(pogodjenoC){
        tekst = myData[i]["C"]["r"];
      }
      else tekst = "Resenje kolone C" ;
    }
    if(indKolone == "D"){
      if(pogodjenoD){
        tekst = myData[i]["D"]["r"];
      }
      else tekst = "Resenje kolone D" ;
    }
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 5.0,
        ),
        child: Container(
          child: Column(
            children: [
              MaterialButton(
                  onPressed: (){
                    return showDialog(
                        context: context,
                        builder:  (context) => AlertDialog(
                          title:Text("Unesite resenje kolone " + indKolone + ":",
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

                              if (value == myData[i][indKolone]["r"]){
                                povecajScore();
                                if(indKolone == "C")
                                  pogodjenoC = true;
                                else pogodjenoD = true;
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
                    tekst,
                    style: Theme.of(context).textTheme.display2,
                      textAlign: TextAlign.center
                  ),
                  color: QuizColors.secondary.color,
                  splashColor: QuizColors.secondary.color,
                  highlightColor: Colors.indigo[700],
                  minWidth: (width - 20.0)/2,
                  height: (height - 130.0)/12,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
              ),
              polje(indKolone, "4"),
              polje(indKolone, "3"),
              polje(indKolone, "2"),
              polje(indKolone, "1"),
            ],
          ),
          width: (width - 20.0)/2,
          height: (height - 110.0)/2,
          color: QuizColors.primary.color ,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    var width = deviceInfo.size.width;
    var height = deviceInfo.size.height;

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

                        if (value == myData[i]['R']) {
                           score = konacnoScore + kolScore + poljeScore + 30;
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                                    ),
                                  content: Container(
                                    child:Column(
                                    children: <Widget>[
                                      Container(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(("Cestitamo, pogodili ste konacno resenje!\nVas score je:  " + score.toString()),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white
                                        ),
                                        ),
                                        ),
                                      width: 200.0,
                                        height:200.0,
                                      ),

                                      MaterialButton(
                                          onPressed: (){
                                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                              builder: (context) => homepage(),
                                            ));
                                          },
                                          child:  Text(
                                            "Nastavi",
                                            style: Theme.of(context).textTheme.display2,
                                          ),
                                          color: QuizColors.secondary.color,
                                          splashColor: QuizColors.secondary.color,
                                          highlightColor: Colors.indigo[700],
                                          minWidth: 200.0,
                                          height: 50.0,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                                      )
                                    ]
                                  ),
                                  width: 300.00,
                                  height: 300.00,
                                      color: QuizColors.primary.color),
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
                  minWidth: width - 70.0,
                  height: (height - 200.0)/12,
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
                      krajIgre = true;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => homepage(),
                      ));
                    },
                    child:  Text(
                     "Preostalo vreme: " +  showTimer + "  Napusti igru",
                      style: Theme.of(context).textTheme.display2,
                    ),
                      color: QuizColors.secondary.color,
                      splashColor: QuizColors.secondary.color,
                      highlightColor: Colors.indigo[700],
                      minWidth: width-50.0,
                      height: (height - 200.0)/12,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                  )
            ]

        ),
        color: QuizColors.background.color,
      )
    );
  }
}