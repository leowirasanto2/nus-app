import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusapp/blocs/newslist/news_list_bloc.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News List'),
      ),
      body: BlocBuilder<NewsListBloc, NewsListState>(
        builder: (context, state) {
          switch (state) {
            case NewsListLoading _:
              return const Center(
                child: Text('loading'),
              );
            case NewsListPageLoaded _:
              return const Center(
                child: Text('news loaded'),
              );
            case NewsListPageError _:
              return const Center(
                child: Text('error'),
              );
            default:
              return const Center(
                child: Text('unknown'),
              );
          }
        },
      ),
    );
  }
}
