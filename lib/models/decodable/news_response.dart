import 'dart:ffi';

import 'package:nusapp/models/viewmodel/news_model.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<ArticleResponse> articles;

  NewsResponse({this.status, this.totalResults, required this.articles});

  LandingViewModel toViewModel() {
    Article? topArticle;
    List<Article> otherArticle = [];

    if (articles.isNotEmpty) {
      topArticle = articles.first.toViewModel();
    }

    if (articles.length > 1) {
      for (var i = 0; i < articles.length; i++) {
        if (i>0) {
          otherArticle.add(articles[i].toViewModel());
        }
      }
    }

    return LandingViewModel(
      headline: topArticle,
      otherArticles: otherArticle,
    );
  }

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json["status"] ?? "",
      totalResults: json["totalResults"] ?? 0,
      articles: json["articles"] == null
          ? []
          : List<ArticleResponse>.from(
              json["articles"]!.map((x) => ArticleResponse.fromJson(x))),
    );
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

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    return ArticleResponse(
      source: json["source"] == null
          ? null
          : SourceResponse.fromJson(json["source"]),
      author: json["author"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      url: json["url"] ?? "",
      urlToImage: json["urlToImage"] ?? "https://picsum.photos/200",
      publishedAt: json["publishedAt"] ?? "",
      content: json["content"] ?? "",
    );
  }

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

  factory SourceResponse.fromJson(Map<String, dynamic> json) {
    return SourceResponse(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
    );
  }

  Source toViewModel() => Source(id: id, name: name);
}
