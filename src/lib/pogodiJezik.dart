import 'dart:convert';
import 'package:flip_card/flip_card.dart';

import 'ui/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

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

  Widget Polje(i){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
          onPressed: () {},
          child: Text(
            'Ovo je neki tekst',
            style: Theme
                .of(context)
                .textTheme
                .display2,
          ),
          color: Theme.of(context).primaryColor,
          splashColor: QuizColors.secondary.color,
          highlightColor: Colors.indigo[700],
          minWidth: 450.0,
          height: 60.0,
          shape: BeveledRectangleBorder(
            side: BorderSide(
              color: Colors.indigo[700]
            )
          )
      ),
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
            Flexible(
              child: Container(
                width: 100,
                height: 80,
              ),
              flex: 2,
            ),
            Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Polje(1),
                    Polje(2),
                    Polje(3),
                    Polje(4),
                    Polje(5)
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                margin: EdgeInsets.only(
                  top: 60
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
              )
            )

          ],
        ),
      ),
    );
  }
}
