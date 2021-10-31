import 'package:flutter/material.dart';
import 'package:sample_design_app/customWidget/roundedContainer.dart';
import 'package:sample_design_app/json12.dart';
import 'package:sample_design_app/models/article.dart';
import 'package:sample_design_app/pages/news_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Pageswiew(),
    ));
  }
}

class Pageswiew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
        scrollDirection: Axis.vertical,
        controller: controller,
        children: Pages(JSon, context));
  }
}

List<Widget> Pages(Map<String, dynamic> json, BuildContext context) {
  List<Widget> page = [];

  Article article = Article(description: "", title: "", urlImage: "");

  List<Article> articlesList = article.lista(json);

  articlesList.forEach((element) {
    page.add(GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => NewsPage(element))),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            'https://source.unsplash.com/random?mono+dark', //element.urlImage,
            fit: BoxFit.cover,
          ),
          Positioned(
              bottom: 30,
              left: 25,
              right: 25,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    roundedContainer(
                        colorText: Colors.white,
                        height: 30,
                        color: Color.fromARGB(80, 210, 210, 210),
                        radiusBorder: 40,
                        name: "argomento  "),
                    SizedBox(height: 10),
                    Text(
                      element.title,
                      style: TextStyle(
                          height: 1.4,
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      element.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          height: 1.4,
                          color: Colors.grey[200],
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                    ),
                  ]))
        ],
      ),
    ));
  });

  return page;
}
