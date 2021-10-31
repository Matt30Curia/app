import 'package:flutter/material.dart';

Widget roundedContainer(
          {EdgeInsets? margin,
          Color? colorText,
          required double height,
          double? widht,
          required Color? color,
          double spaceBetween = 10,
          required double radiusBorder,
          required String name,
          Widget? photo /*can you add image or icon*/}) =>
      Container(
        height: height,
        margin: margin,
        child: photo == null
            ? Container(
                child: Text(name + " ",
                    style: TextStyle(color: colorText, fontSize: 15)),
                margin: EdgeInsets.only(left: 10, top: 7.1))
            : Row(
                children: [
                  SizedBox(width: 10),
                  photo,
                  SizedBox(width: spaceBetween),
                  Text(
                    name+ " ",
                    style: TextStyle(color: colorText, fontSize: 15),
                  ),
                  SizedBox(width: 10),
                ],
              ),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(radiusBorder)),
      );
