import 'package:flutter/material.dart';
import 'package:sample_design_app/pages/mainPage.dart';

class App extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App News',
      home: MainPage(),

      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.grey[300],
      ),
    );
  }
}

