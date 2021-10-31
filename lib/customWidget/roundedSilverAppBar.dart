import 'package:flutter/material.dart';

class RoundedSilverAppBar extends SliverPersistentHeaderDelegate { //delegate sella silverAppbar
  final double expandedHeight;
  List<Widget> children;
  final String urlImage;

  RoundedSilverAppBar({
    required this.urlImage, //url immagine nella topBar
    required this.expandedHeight, //dimensione parte alta della tapBar
    required this.children,//list di widget da inserire nel tapBar
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
        fit: StackFit.expand,
        children: [buildBackground(shrinkOffset)] +
             [
              Positioned(//partte alta del silver appbar per aggiungere laparte arrotonadata nel body
                  bottom: -21,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                  )),
            ] +
            children);
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight; //metodo che ritorna livello di opacità

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;//metodo che ritorna livello di opacità

  Widget buildBackground(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}