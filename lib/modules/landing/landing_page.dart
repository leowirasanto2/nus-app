import 'package:flutter/material.dart';
import 'package:nusapp/models/viewmodel/news_model.dart';
import 'package:nusapp/modules/landing/views/landing_news_list_widget.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  final List<Article> articles = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        const AppBarWidget('Headline News', 'imagePath'),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => LandingNewsListWidget(articles[index]),
            childCount: articles.length,
          ),
        )
      ],
    ));
  }
}

class AppBarWidget extends StatelessWidget {
  final String title;
  final String imagePath;

  const AppBarWidget(this.title, this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      expandedHeight: 250.0,
      pinned: true,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://picsum.photos/250/150',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
