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
    return Text(mydata[0]['P'][i.toString()].toString());
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Polje(1),
        Polje(2),
        Polje(3),
        Polje(4),
        Polje(5)
      ],
    );
  }
}
