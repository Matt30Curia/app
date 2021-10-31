import 'package:flutter/material.dart';

Widget roundedContainer(
        {required Color? color,//colore roundedContainer
        required double height, //altezza roundedContainer
        required double radiusBorder, //radius bordo
        required String name, //testo roundedContainer
        EdgeInsets? margin, //distanza dagli altri widget
        Color? colorText, // colore del testo
        double? widht, //larghezza roundedContainer se non specificata la si calcola in automatico
        double spaceBetween = 10, //spazio tra testo e foto o iconnel roundedContainer
        Widget? photo /*pui aggiungere foto o icn*/}) =>
    Container(
      height: height,
      margin: margin,
      //if in-line per stabilire il child del container
      child: photo == null
          ? Container(
              //container con il testo
              child: Text(name + " ",
                  style:
                      TextStyle(color: colorText, fontSize: 15)), //stile text
              margin: EdgeInsets.only(left: 10, top: 7.1)) //margini
          : Row(
              children: [
                SizedBox(width: 10), //distanza dal bordo a sx
                photo, //widget specificato nella funzione
                SizedBox(width: spaceBetween),
                Text(
                  name + " ",//spazio alla fine per non fare attacare il sto alla fine
                  style: TextStyle(color: colorText, fontSize: 15),
                ),
                SizedBox(width: 10), //sistanza alla fine del widget
              ],
            ),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radiusBorder)), //bordi
    );
