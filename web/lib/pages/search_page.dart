import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:sample_design_app/customWidget/roundedPhoto.dart';
import 'package:sample_design_app/models/article.dart';
import 'package:sample_design_app/json12.dart';

import 'news_page.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            //tapbar
            body: DefaultTabController(
      length: _tabBarWiew(context).length,
      //child tapbar
      child: NestedScrollView(
          //body tapBar
          body: TabBarView(children: _tabBarWiew(context)),
          headerSliverBuilder: (context, value) => <Widget>[
                SliverAppBar(
                  floating: true,
                  expandedHeight: 300,
                  bottom: TabBar(
                      labelPadding: const EdgeInsets.only(right: 25, left: 25),
                      indicatorPadding:
                          const EdgeInsets.only(right: 25, left: 25),
                      isScrollable: true,
                      indicatorColor: const Color(0xFF000000),
                      tabs: _tabsName()),
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      collapseMode: CollapseMode.pin,
                      background: _costomWidgetAppBar()),
                ),
              ]),
    )));
  }
}

Widget _listNews(BuildContext context) {
  Article article = Article(description: "", title: "", urlImage: "");
  List<Article> articlesList = article.lista(JSon);
  List<Widget> tile = [Container()];

  articlesList.forEach((listNews) {
    tile.add(GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewsPage(listNews)));
        },
        child: Padding(
          padding:
              const EdgeInsets.only(right: 20, left: 15, top: 15, bottom: 15),
          child: Row(
            children: <Widget>[
              roundedPhoto(listNews.urlImage,
                  height: 70, whidht: 70, radius: 17),
              const SizedBox(width: 20),
              _textNews(listNews.title, listNews.description),
            ],
          ),
        )));
  });

  return Container(color: Colors.white, child: Column(children: tile));
}

List<Widget> _tabBarWiew(BuildContext context) {
  List<Widget> lista = [];

  _tabsName().forEach((element) {
    lista.add(
      ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) => _listNews(context)),
    );
  });

  return lista;
}

List<Widget> _tabsName() {
  List<String> argument = [
    "Tecnologia",
    "Criptomonete",
    "Borsa",
    "Cronaca",
    "Ultime Notizie",
    "Ultime Notizie",
    "Ultime Notizie",
    "Ultime Notizie",
  ];

  List<Widget> tab = [];

  argument.forEach((element) {
    tab.add(Tab(
      text: element,
    ));
  });

  return tab;
}

Column _costomWidgetAppBar() {
  return Column(
    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const SizedBox(height: 80),
      _titleText(),
      _subTitleText(),
      const SizedBox(
        height: 60,
      ),
      _searchBar()
    ],
  );
}

Widget _titleText() {
  return Container(
    height: 40,
    margin: const EdgeInsets.only(left: 25, right: 25),
    child: const Text(
      "Discover",
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black),
    ),
  );
}

Widget _subTitleText() {
  return Container(
      height: 17,
      margin: const EdgeInsets.only(left: 25, right: 25, top: 1),
      child: const Text(
        "News from all over the world",
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Color(0xFFBDBDBD)),
      ));
}

Widget _textNews(String title, String description) {
  return Expanded(
      flex: 2,
      child: Container(
          height: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.start,
                maxLines: 2,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                maxLines: 2,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          )));
}

Widget _searchBar() {
  return Container(
    height: 55,
    margin: const EdgeInsets.only(right: 25, left: 25, bottom: 30),
    decoration: const BoxDecoration(
        color: Color(0xFFEEEEEE),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: TextField(
      cursorColor: const Color(0xFF9E9E9E),
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFEEEEEE)),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        border: InputBorder.none,
        labelText: 'Serch news',
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xFF9E9E9E),
        ),
        labelStyle: const TextStyle(color: Color(0xFF9E9E9E)),
      ),
    ),
  );
}
