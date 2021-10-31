class Article {
  String title;
  String urlImage;
  String description;
  String? content;


  Article(
      {required this.description, required this.title, required this.urlImage, this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        title: json['title'],
        description: json['description'],
        urlImage: json['urlToImage'],
        content: json['content']);
  }

  List<Article> lista(Map <String, dynamic> json) => (json['articles'] as List)
      .map((articles) => Article.fromJson(articles))
      .toList();

}
