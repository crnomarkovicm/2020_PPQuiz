import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flip_card/flip_card.dart';
import 'package:ppquiz/koznazna.dart';
import 'package:ppquiz/asocijacije.dart';
import 'dart:io';
import 'package:ppquiz/pogodiJezik.dart';
import 'package:ppquiz/theme.dart';
import 'package:provider/provider.dart';


var darkModeEnabled = true;

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> images = [
    "assets/pictures/asocijacije.jpg",
    "assets/pictures/pogodijezik.jpg",
    "assets/pictures/koznazna.jpg",
    "assets/pictures/nesto.jpeg",
  ];

  int marks = 0;

  // Nakon splashscreen-a prikazuje se pocetni ekran na kom
  // imamo mogucnost da izaberemo igru. Ovde pravimo jednu
  // karticu na kojoj ce biti ispisan znak ili ime igre kako
  // bi korisnik lako izabrao koju igru zeli.
  Widget customcard(naziv_igre, logo_igre, opis_igre, indikator){
    return Padding(
      padding: EdgeInsets.all(
        20.0,
      ),
      child: InkWell(
        child: Material(
          color: Theme.of(context).primaryColor,
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
                        style: Theme.of(context).textTheme.subhead,
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
                     Text(
                        opis_igre,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    Center(
                      child: FlatButton(
                        color: Theme.of(context).buttonColor,
                        padding: EdgeInsets.all(2.00),
                        onPressed: () {
                          if (indikator == "kzz") {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => ko_zna_zna(),
                                ));
                          } else if (indikator == "asoc"){
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => asocijacije(),
                                ));
                          }
                          else if (indikator == "pj"){
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => JezikInfo(),
                                ));
                          }
                        },
                        child: Text(
                          "Igraj!",
                            style: Theme.of(context).textTheme.button,
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
  ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

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
                  "Da li ste sigurni da zelite da izadjete iz aplikacije?",
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
            backgroundColor:Theme.of(context).backgroundColor,
            appBar: AppBar(
              actions: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Tema: ',
                        style: Theme.of(context).textTheme.display2
                    ),
                    Expanded(
                        child:Switch(
                          value: false,
                          activeColor: Theme.of(context).cursorColor,
                          inactiveThumbColor: Theme.of(context).backgroundColor,

                          onChanged: (bool) {
                            if(darkModeEnabled) {
                              darkModeEnabled = false;
                              return _themeChanger.setTheme(ThemeData.light());
                            } else {
                              darkModeEnabled = true;
                              return _themeChanger.setTheme(ThemeData.dark());
                            }

                          },
                        ))
                  ],
                )
              ],
              backgroundColor: Theme.of(context).primaryColor,
              centerTitle: true,
              title: Text(
                'PPQuiz',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
            body: ListView(
              children: <Widget>[
                customcard("Asocijacije", images[0], "Cilj ove igre je sa sto manje otvorenih polja naci prvo resenja za kolone A, B, C i D a potom i konacno resenje.", "asoc"),
                customcard("Pogodi jezik", images[1], "Cilj ove igre je otvaranjem datih osobina pogoditi o kom programskom jeziku je rec.", "pj"),
                customcard("Ko zna zna", images[2], "Cilj ove igre je odgovoriti tacno na sto vise od 10 postavljenih pitanja. Za svako od njih ponudjena su 4 odgovora.", "kzz"),
              ],
            )
        )
    );;
  }
}
