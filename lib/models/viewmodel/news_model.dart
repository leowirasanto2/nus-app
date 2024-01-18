class NewsViewModel {
  String? status;
  int? totalResults;
  List<Article> articles;

  NewsViewModel({this.status, this.totalResults, required this.articles});
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });
}
