import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [
    "assets/pictures/asoc.jpeg",
    "assets/pictures/pj.jpeg",
    "assets/pictures/kzz.jpeg",
    "assets/pictures/nesto.jpeg",
  ];

  // Nakon splashscreen-a prikazuje se pocetni ekran na kom
  // imamo mogucnost da izaberemo igru. Ovde pravimo jednu
  // karticu na kojoj ce biti ispisan znak ili ime igre kako
  // bi korisnik lako izabrao koju igru zeli.
  Widget customcard(naziv_igre, logo_igre){
    return Padding(
      padding: EdgeInsets.all(
        20.0,
      ),
      child: InkWell(
        child: Material(
          color: Colors.blue,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(
                            logo_igre
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    naziv_igre,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          'PPQuiz',
          style: TextStyle(
            fontSize: 25.0
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Asocijacije", images[0]),
          customcard("Pogodi jezik", images[1]),
          customcard("Ko zna zna", images[2]),
          customcard("Jos jedna igra, smislicemo!", images[3]),
        ],
      )
    );
  }
}
