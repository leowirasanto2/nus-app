import 'package:flutter/material.dart';
import 'package:nusapp/models/viewmodel/news_model.dart';

class LandingNewsListWidget extends StatelessWidget {
  const LandingNewsListWidget(this.article, {super.key});

  final Article? article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 100,
              height: 80,
              child: Image.network(
                article?.urlToImage ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  article?.title ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                // Subtitle
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(article?.publishedAt ?? ''),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
