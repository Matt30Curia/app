import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_design_app/modelProvider/bottomBarProvider.dart';

Widget customBotNavigationBar(BuildContext context, int selectedIndex) {
  //consumer per ottenere le informazioni dallo stato
  return Consumer<BottomBarProvider>(builder: (context, bottomBar, child) {
    return BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[400],
        onTap: (int index) {
          //consente di notificare un cambiamento nello stato || listen: false non effetua il rirendering del componenete
          Provider.of<BottomBarProvider>(context, listen: false)
              .setIndex(index);
        },
        //index corrente dal consumer 
        currentIndex: bottomBar.index,
        items: [//elementi bottomAppBar
          _navigationBarItem("home page", Icons.home_filled),
          _navigationBarItem("discover page", Icons.search)
        ]);
  });
}

BottomNavigationBarItem _navigationBarItem(String name, IconData icon) =>
    BottomNavigationBarItem(
        icon: Icon(
          icon,
        ),
        label: name);
