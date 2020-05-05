import 'dart:convert';
import 'package:flip_card/flip_card.dart';
import 'dart:async';
import 'ui/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'home.dart';
import 'dart:math';

class JezikInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/jezik.json"),
      builder: (context, snapshot){
        List mydata = json.decode(snapshot.data.toString());
        if(mydata == null){
          return Scaffold(
            body: Center(
              child: Text(
                "Loading...",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
        else{
          return PogodiJezik(mydata : mydata);
        }
      },
    );
  }

}


class PogodiJezik extends StatefulWidget {

  var mydata;

  PogodiJezik({Key key, @required this.mydata}) : super(key : key);
  @override
  _PogodiJezikState createState() => _PogodiJezikState(mydata);
}

class _PogodiJezikState extends State<PogodiJezik> {

  var mydata;
  _PogodiJezikState(this.mydata);

  int i = 0;
  var rnd = new Random();


  int timer = 60;

  var izadji = false;

  @override
  void initState(){

    var izadji = false;
    int timer = 60;
    i = rnd.nextInt(2);
    super.initState();
  }

  var show_timer = "60";
  var prva_karta = false;
  var igra_se = false;

  void start(){
    if(!igra_se) {
      igra_se = true;
      const sec = Duration(seconds: 1);
      Timer.periodic(sec, (Timer t) {

        if(izadji){
          // TODO -> cancel timer
        }
        setState(() {
          if (timer < 1) {
            timer = 60;
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    content: Container(
                        child: Column(
                            children: <Widget>[
                              Container(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    ("Nazalost, vreme je isteklo :(\nNiste pogodili jezik"),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                                width: 200.0,
                                height: 200.0,),

                              MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) => JezikInfo(),
                                        ));
                                  },
                                  child: Text(
                                    "Igraj ponovo",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .display2,
                                  ),
                                  color: QuizColors.secondary.color,
                                  splashColor: QuizColors.secondary.color,
                                  highlightColor: Colors.indigo[700],
                                  minWidth: 200.0,
                                  height: 50.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0))
                              )
                            ]
                        ),
                        width: 300.00,
                        height: 300.00,
                        color: QuizColors.primary.color),
                  );
                });
          }


          if (!prva_karta)
            cardKey1.currentState.toggleCard();

          prva_karta = true;

          if (timer == 50) {
            cardKey2.currentState.toggleCard();
          }

          if (timer == 40) {
            cardKey3.currentState.toggleCard();
          }

          if (timer == 30) {
            cardKey4.currentState.toggleCard();
          }

          if (timer == 20) {
            cardKey5.currentState.toggleCard();
          }

          if (timer >= 1)
            timer = timer - 1;
          show_timer = timer.toString();
        }
        );
      });
    }
  }

  GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey3 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey4 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey5 = GlobalKey<FlipCardState>();

  Widget Polje(broj,tekst,key){

    var hint = broj.toString() + ". Hint";

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 20.0,
      ),
      child: FlipCard(
        flipOnTouch: false,
        key: key,
        direction: FlipDirection.HORIZONTAL,
        back: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 5.0,
            ),
            child: Material(
              elevation: 5.0,
              borderRadius:  BorderRadius.circular(100.00),
              child: Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    tekst,
                    style: Theme.of(context).textTheme.display1,
                    textAlign: TextAlign.center,
                  ),
                ),
                color: QuizColors.primary.color,
                width: 350.0,
                height: 50.0,
              ),
            )
        ),
        front: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 5.0,
            ),
            child: Material(
              elevation: 5.0,
              borderRadius:  BorderRadius.circular(100.00),
              child: Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    hint,
                    style: Theme.of(context).textTheme.display1,
                    textAlign: TextAlign.center,
                  ),
                ),
                color: QuizColors.primary.color,
                width: 350.0,
                height: 50.0,
              ),
            )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    var a;

    if(i==0){
      a='P';
    }
    else a = 'J';

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
                "Da li ste sigurni da zelite da izadjete iz aplikacije dok je igra 'Pogodi jezik' u toku?",
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
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: 50,
                  bottom: 10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        height: 50,
                        minWidth: 100,
                        color: Colors.black,
                        disabledColor: Colors.black,
                        onPressed: () => start(),
                        child: Text(
                          'Zapocni Igru!',
                          style: Theme.of(context).textTheme.display2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        height: 50,
                        minWidth: 100,
                        color: Colors.black,
                        disabledColor: Colors.black,
                        onPressed: () => {
                          Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                          builder: (context) => homepage(),
                        ))
                        },
                        child: Text(
                          'Napusti Igru!',
                          style: Theme.of(context).textTheme.display2,
                        ),
                      ),
                    ),
                  ],
                )
              )
            ),
            Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Polje(1,mydata[i][a]["1"].toString(),cardKey1),
                    Polje(2,mydata[i][a]["2"].toString(),cardKey2),
                    Polje(3,mydata[i][a]["3"].toString(),cardKey3),
                    Polje(4,mydata[i][a]["4"].toString(),cardKey4),
                    Polje(5,mydata[i][a]["5"].toString(),cardKey5)
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: 10
                    ),
                    width: 300,
                    height: 30,
                    child: Text(
                      'Unesite resenje:',
                      style: Theme.of(context).textTheme.display1,
                    ),
              ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 20
                    ),
                    width: 300,
                    height: 80,
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.body1,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.indigo[700],
                                  width: 2
                              )
                          )
                      ),
                    ),
                  ),
                  Text(
                    "vreme: " + show_timer,
                    style: Theme.of(context).textTheme.display1,
                  )
                ],
              )
            )

          ],
        ),
      ),
    );
  }
}
