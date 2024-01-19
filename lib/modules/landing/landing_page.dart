import 'package:flutter/material.dart';
import 'package:nusapp/models/viewmodel/news_model.dart';
import 'package:nusapp/modules/landing/views/landing_header_widget.dart';
import 'package:nusapp/modules/landing/views/landing_main_news_tile_widget.dart';
import 'package:nusapp/modules/landing/views/landing_news_list_widget.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: false,
          expandedHeight: 470,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                LandingHeaderWidget(),
                SizedBox(
                  height: 8,
                ),
                LandingMainNewsTileWidget(),
              ],
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            vertical: 8,
          ),
        ),
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return LandingNewsListWidget(
                  NewsViewModel.dummyArticles()[index]);
            }, childCount: NewsViewModel.dummyArticles().length),
            itemExtent: 80)
      ],
    ));
  }
}
