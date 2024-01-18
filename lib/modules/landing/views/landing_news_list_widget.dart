import 'package:flutter/material.dart';
import 'package:nusapp/models/viewmodel/news_model.dart';

class LandingNewsListWidget extends StatelessWidget {
  const LandingNewsListWidget(this.article, {super.key});

  final Article? article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 4),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        leading: Image.network(
          article?.urlToImage ?? '',
          fit: BoxFit.cover,
        ),
        title: Center(
          child: Text(
            article?.title ?? '',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
        ),
        subtitle: Row(
          children: [
            const Icon(Icons.calendar_month),
            const SizedBox(
              width: 8,
            ),
            Text(article?.publishedAt ?? '',
            )
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
