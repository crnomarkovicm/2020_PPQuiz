import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flip_card/flip_card.dart';


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
  Widget customcard(naziv_igre, logo_igre, opis_igre){
    return Padding(
      padding: EdgeInsets.all(
        20.0,
      ),
      child: InkWell(
        child: Material(
          color: Colors.blue,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          child: FlipCard(
            direction: FlipDirection.HORIZONTAL,
            front: Container(
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
            back: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                    ),
                    Center(
                      child: Text(
                        opis_igre,
                        style: TextStyle(
                          fontSize: 21.0,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ],
                )
            ),
          )
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
          customcard("Asocijacije", images[0], "Cilj ove igre je sa sto manje otvorenih polja naci prvo resenja za kolone A, B, C i D a potom i konacno resenje"),
          customcard("Pogodi jezik", images[1], "Cilj ove igre je otvaranjem datih osobina pogoditi o kom programskom jeziku je rec "),
          customcard("Ko zna zna", images[2], "Cilj ove igre je odgovoriti na 10 postavljenih pitanja. Za svako od njih ponudjena su 4 odgovora. Ukoliko nakon 10s nije odgovoreno, smatra se da ste pogresili"),
          customcard("Jos jedna igra, smislicemo!", images[3], "TODO"),
        ],
      )
    );
  }
}
