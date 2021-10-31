import 'package:flutter/material.dart';

//model provider della bottomBar
class BottomBarProvider extends ChangeNotifier {
  int _index=0; //posizione iniziale
  BottomBarProvider();

  void setIndex(int index) {//quando viene settatto un novo index notifico agli changeNotifierProvider in ascolto il chambiamento di stato
    _index = index;
    notifyListeners();
  }

  int get index => _index; //otengo l'index corrente4
}
