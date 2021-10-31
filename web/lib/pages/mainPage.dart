import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:sample_design_app/cubit/bottomnvigationbar_cubit.dart';
import 'package:sample_design_app/customWidget/customNavigationBar.dart';
import 'package:sample_design_app/pages/home_page.dart';
import 'package:sample_design_app/pages/search_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CubitProvider(
        create: (_) => BottomnvigationbarCubit(),
        child: LayoutBuilder(
          builder: (context, _) =>
              CubitBuilder<BottomnvigationbarCubit, BottomnvigationbarState>(
            builder: (context, state) => Scaffold(
              body: pageArray(
                  children: [HomePage(), SearchPage()], index: state.index),
              bottomNavigationBar: customBotNavigationBar(context, state.index),
            ),
          ),
        ));
  }
}

Widget pageArray({required List<Widget> children, required int index}) =>
    children[index];
