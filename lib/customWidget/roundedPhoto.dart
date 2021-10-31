import 'package:flutter/material.dart';

Widget roundedPhoto(String imgUrl,
        {double height = 20, double whidht = 20, double radius = 20}) =>
    Container(
      height: height,
      width: whidht,
      decoration: BoxDecoration(
        color: const Color(0xFF9E9E9E), //colore quando si attande l'immagine
        image: DecorationImage(
          fit: BoxFit.cover, //coperura immagine
          image: NetworkImage(imgUrl),
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
