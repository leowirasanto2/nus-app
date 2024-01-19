class NewsViewModel {
  String? status;
  int? totalResults;
  List<Article> articles;

  NewsViewModel({this.status, this.totalResults, required this.articles});

  static List<Article> dummyArticles() {
    return [
      Article(
          source: Source(name: 'source name', id: 'id_source'),
          author: 'author',
          title: 'Title is this 1',
          description: 'desc',
          url: '',
          urlToImage: 'https://picsum.photos/250',
          publishedAt: 'Januari 2024'),
      Article(
          source: Source(name: 'source name', id: 'id_source'),
          author: 'author',
          title: 'Title is this 2',
          description: 'desc',
          url: '',
          urlToImage: 'https://picsum.photos/250',
          publishedAt: 'Januari 2024'),
      Article(
          source: Source(name: 'source name', id: 'id_source'),
          author: 'author',
          title: 'Title is this 3',
          description: 'desc',
          url: '',
          urlToImage: 'https://picsum.photos/250',
          publishedAt: 'Januari 2024'),
      Article(
          source: Source(name: 'source name', id: 'id_source'),
          author: 'author',
          title: 'Title is this 4',
          description: 'desc',
          url: '',
          urlToImage: 'https://picsum.photos/250',
          publishedAt: 'Januari 2024'),
      Article(
          source: Source(name: 'source name', id: 'id_source'),
          author: 'author',
          title: 'Title is this 4',
          description: 'desc',
          url: '',
          urlToImage: 'https://picsum.photos/250',
          publishedAt: 'Januari 2024'),
      Article(
          source: Source(name: 'source name', id: 'id_source'),
          author: 'author',
          title: 'Title is this 4',
          description: 'desc',
          url: '',
          urlToImage: 'https://picsum.photos/250',
          publishedAt: 'Januari 2024'),
      Article(
          source: Source(name: 'source name', id: 'id_source'),
          author: 'author',
          title: 'Title is this 4',
          description: 'desc',
          url: '',
          urlToImage: 'https://picsum.photos/250',
          publishedAt: 'Januari 2024'),
      Article(
          source: Source(name: 'source name', id: 'id_source'),
          author: 'author',
          title: 'Title is this 4',
          description: 'desc',
          url: '',
          urlToImage: 'https://picsum.photos/250',
          publishedAt: 'Januari 2024'),
      Article(
          source: Source(name: 'source name', id: 'id_source'),
          author: 'author',
          title: 'Title is this 4',
          description: 'desc',
          url: '',
          urlToImage: 'https://picsum.photos/250',
          publishedAt: 'Januari 2024'),
      Article(
          source: Source(name: 'source name', id: 'id_source'),
          author: 'author',
          title: 'Title is this 4',
          description: 'desc',
          url: '',
          urlToImage: 'https://picsum.photos/250',
          publishedAt: 'Januari 2024'),
      Article(
          source: Source(name: 'source name', id: 'id_source'),
          author: 'author',
          title: 'Title is this 4',
          description: 'desc',
          url: '',
          urlToImage: 'https://picsum.photos/250',
          publishedAt: 'Januari 2024'),
      Article(
          source: Source(name: 'source name', id: 'id_source'),
          author: 'author',
          title: 'Title is this 4',
          description: 'desc',
          url: '',
          urlToImage: 'https://picsum.photos/250',
          publishedAt: 'Januari 2024'),
      Article(
          source: Source(name: 'source name', id: 'id_source'),
          author: 'author',
          title: 'Title is this 4',
          description: 'desc',
          url: '',
          urlToImage: 'https://picsum.photos/250',
          publishedAt: 'Januari 2024'),
      Article(
          source: Source(name: 'source name', id: 'id_source'),
          author: 'author',
          title: 'Title is this 4',
          description: 'desc',
          url: '',
          urlToImage: 'https://picsum.photos/250',
          publishedAt: 'Januari 2024'),
      Article(
          source: Source(name: 'source name', id: 'id_source'),
          author: 'author',
          title: 'Title is this 4',
          description: 'desc',
          url: '',
          urlToImage: 'https://picsum.photos/250',
          publishedAt: 'Januari 2024'),
      Article(
          source: Source(name: 'source name', id: 'id_source'),
          author: 'author',
          title: 'Title is this 4',
          description: 'desc',
          url: '',
          urlToImage: 'https://picsum.photos/250',
          publishedAt: 'Januari 2024'),
    ];
  }
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
