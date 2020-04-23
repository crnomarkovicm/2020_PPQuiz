import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ppquiz/home.dart';
import 'package:ppquiz/koznazna.dart';

class koznazna_score extends StatefulWidget {
  int marks;
  koznazna_score({Key key , @required this.marks}) : super(key : key);
  @override
  _koznazna_scoreState createState() => _koznazna_scoreState(marks);
}

class _koznazna_scoreState extends State<koznazna_score> {

  List<String> images = [
    "assets/pictures/srecan.jpeg",
    "assets/pictures/tuzan.png",
    "assets/pictures/smor.webp",
  ];
  int marks;
  _koznazna_scoreState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Material(
              elevation: 10.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                          width: 300.0,
                          height: 300.0,
                          child: ClipRect(
                            child: Image(
                              image: AssetImage(
                              "assets/pictures/srecan.jpeg",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 15.0,
                      ),
                      child: Center(
                        child: Text(
                          "Skor: $marks",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => homepage(),
                    ));
                  },
                  child:  Text(
                    "Nastavi",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical:  10.0,
                    horizontal: 25.0,
                  ),
                  borderSide: BorderSide(width: 3.0, color: Colors.indigo),
                  splashColor: Colors.indigoAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
