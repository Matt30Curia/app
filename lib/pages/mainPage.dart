import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_design_app/customWidget/customNavigationBar.dart';
import 'package:sample_design_app/modelProvider/bottomBarProvider.dart';

import 'home_page.dart';
import 'search_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ricostruisce i widget quando viene notificato il cambiamento dai modelProvider
    return ChangeNotifierProvider<BottomBarProvider>(
        create: (context) => BottomBarProvider(),
        child:
        //consumer per ottenere l'inex correnet
            Consumer<BottomBarProvider>(builder: (context, bottomBar, child) {
          return Scaffold(
              body: pageArray(
                children:  [HomePage(), SearchPage()],
                index: bottomBar.index,
              ),
              bottomNavigationBar: customBotNavigationBar(context, 1));
        }));
  }
}

Widget pageArray({required List<Widget> children, required int index}) {
  return children[index];
}

