import 'package:flutter/material.dart';
import 'package:sample_design_app/customWidget/roundedContainer.dart';
import 'package:sample_design_app/customWidget/roundedPhoto.dart';
import 'package:sample_design_app/customWidget/roundedSilverAppBar.dart';
import 'package:sample_design_app/models/article.dart';

const double _heightAppBar = 400;

class NewsPage extends StatelessWidget {
  final Article article;

  NewsPage(this.article);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: RoundedSilverAppBar(//appbar custom
                urlImage: 'https://source.unsplash.com/random?mono+dark',
                expandedHeight: _heightAppBar,
                children: appBarChildren(context)),
            pinned: false,//se resta sempre fissata in alta
          ),
          //body con il etsto notizia 
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            Container(
                color: Colors.white,
                child: Container(
                  color: Colors.white,
                    margin: EdgeInsets.only(right: 25, left: 25, top: 20),
                    child: Text(
                      article.description,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w700,
                        height: 1.6,
                        fontSize: 15,
                      ),
                    )))
          ]))
        ],
      ),
    ));
  }

  List<Widget> appBarChildren(BuildContext context) => <Widget>[
        //freccia indietro
        Positioned(
            left: 15,
            top: 20,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            )),
            //author and photo
        Positioned(
            left: 25,
            bottom: 0,
            child: roundedContainer(
                photo: roundedPhoto(
                    'https://source.unsplash.com/random?mono+dark'),
                height: 30,
                color: Colors.black,
                colorText: Colors.white,
                radiusBorder: 30,
                name: "Matte")),
        
        Positioned(
            left: (MediaQuery.of(context).size.width / 2) - 40,
            bottom: 0,
            child: roundedContainer(
                photo: Icon(Icons.access_time),
                height: 30,
                widht: 30,
                color: Colors.grey[200],
                radiusBorder: 30,
                name: tempoLettura(article.description))),
        Positioned(
            right: 25,
            bottom: 0,
            child: roundedContainer(
                photo: Icon(Icons.remove_red_eye),
                height: 30,
                widht: 30,
                color: Colors.grey[200],
                radiusBorder: 30,
                name: "200")),
        Positioned(
            right: 25,
            left: 25,
            bottom: 80,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  roundedContainer(
                    height: 30,
                    colorText: Colors.white,
                    name: "Argomento selezionato da tap bar ",
                    color: Color.fromRGBO(255, 255, 255, 0.3),
                    radiusBorder: 30,
                  ),
                  SizedBox(height: 10),
                  Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        article.title,
                        style: TextStyle(
                            height: 1.4,
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ))
                ]))
      ];

  String tempoLettura(String testo, {int tempoLettura = 220}) {
    int contaParole(String frase) {
      int _parole = 0;

      for (int i = 0; i < frase.length; i++) {
        if ((frase[i] == "-" || frase[i] == " " || frase[i] == "  ")) {
          _parole++;
        }
      }
      return _parole += 1;
    }

    DateTime tempo = DateTime(2000);

    int secondi = (contaParole(testo) / tempoLettura * 60).toInt();

    tempo = tempo.add(Duration(seconds: secondi));

    return tempo.minute > 0 ? "${tempo.minute} Min " : "${tempo.second} Sec ";
  }
}
