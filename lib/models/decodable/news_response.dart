import 'package:nusapp/models/viewmodel/news_model.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<ArticleResponse> articles;

  NewsResponse({this.status, this.totalResults, required this.articles});

  NewsViewModel toViewModel() => NewsViewModel(
      status: status,
      totalResults: totalResults,
      articles: articles.map((e) => e.toViewModel()).toList());

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'status': String status,
        'totalResults': int totalResult,
        'articles': List<ArticleResponse> articles,
      } =>
        NewsResponse(status: status, totalResults: totalResult, articles: articles),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

class ArticleResponse {
  SourceResponse? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticleResponse(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Article toViewModel() => Article(
      source: source?.toViewModel(),
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content);
}

class SourceResponse {
  String? id;
  String? name;

  SourceResponse({
    this.id,
    this.name,
  });

  Source toViewModel() => Source(id: id, name: name);
}
