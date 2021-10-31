import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_design_app/cubit/bottomnvigationbar_cubit.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

Widget customBotNavigationBar(BuildContext context, int selectedIndex) {
  return BottomNavigationBar(
    selectedItemColor: Colors.black,
     unselectedItemColor: Colors.grey[400],
      onTap: (int index) {
        context.cubit<BottomnvigationbarCubit>().changePage(index);
      },
      currentIndex: selectedIndex ,
      items: [
        _navigationBarItem("home page", Icons.home_filled),
        _navigationBarItem("second page", Icons.search)
      ]);
}

BottomNavigationBarItem _navigationBarItem(String name, IconData icon) =>
    BottomNavigationBarItem(icon: Icon(icon,), label: name);
