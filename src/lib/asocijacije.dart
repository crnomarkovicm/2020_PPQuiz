import 'dart:convert';
import 'ui/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class asocijacije extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/asocijacije.json"),
      builder: (context, snapshot){
        var mydata = json.decode(snapshot.data.toString());
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
          return asoc();
        }
      },
    );
  }
}

class asoc extends StatefulWidget {
  @override
  _asocState createState() => _asocState();
}

class _asocState extends State<asoc> {
  Widget polje(){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 5.0,
      ),
      child: MaterialButton(
          onPressed: (){},
          child: Text(
            "Polje",
            style: Theme.of(context).textTheme.display2,
          ),
          color: QuizColors.primary.color,
          splashColor: QuizColors.secondary.color,
          highlightColor: Colors.indigo[700],
          minWidth: 200.0,
          height: 30.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
      ),
    );

  }

  Widget kolona1(){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: Container(
        child: Column(
          children: [
            polje(),
            polje(),
            polje(),
            polje(),
            MaterialButton(
                onPressed: (){},
                child: Text(
                  "Resenje kolone",
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

  Widget kolona2(){
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        child: Container(
          child: Column(
            children: [
              MaterialButton(
                  onPressed: (){},
                  child: Text(
                    "Resenje kolone",
                    style: Theme.of(context).textTheme.display2,
                  ),
                  color: QuizColors.secondary.color,
                  splashColor: QuizColors.secondary.color,
                  highlightColor: Colors.indigo[700],
                  minWidth: 200.0,
                  height: 40.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
              ),
              polje(),
              polje(),
              polje(),
              polje(),

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
    return Container(
      child: Column(
        children: [
          Row (
            children: <Widget>[
              kolona1(),
              kolona1(),
            ],
          ),
    MaterialButton(
             onPressed: (){},
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
              kolona2(),
              kolona2(),
            ],
          ),


              ]

      ),
      color: QuizColors.background.color,
    );
  }
}
