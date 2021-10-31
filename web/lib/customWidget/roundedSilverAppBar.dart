import 'package:flutter/material.dart';

class RoundedSilverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  List<Widget> children;
  final String urlImage;

  RoundedSilverAppBar({
    required this.urlImage,
    required this.expandedHeight,
    required this.children,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
        fit: StackFit.expand,
        children: [buildBackground(shrinkOffset)] +
             [
              Positioned(
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

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

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