import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusapp/blocs/newslist/news_list_bloc.dart';
import 'package:nusapp/modules/landing/views/landing_news_item_list_widget.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer? debounce;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: TextEditingController(),
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'type to search news topic',
            border: InputBorder.none,
          ),
          onChanged: (keyword) {
            onSearchTextChanged(context, keyword, debounce);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<NewsListBloc, NewsListState>(
              listener: (context, state) {
                switch (state) {
                  default:
                    print('testing aja ga sih');
                }
              },
              builder: (context, state) {
                switch (state) {
                  case NewsListLoading _:
                    return const Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.youtube_searched_for_outlined,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'searching your news',
                          ),
                        ],
                      ),
                    );
                  case NewsListPageLoaded _:
                    return ListView.builder(
                      itemCount: state.data.newsList.length,
                      itemExtent: 80,
                      itemBuilder: (context, index) {
                        return LandingNewsItemListWidget(
                            state.data.newsList[index]);
                      },
                    );
                  case NewsListPageSearchKeywordMinimumErrorState _:
                    return const Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.keyboard_alt_outlined,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Please type at least 3 characters',
                          ),
                        ],
                      ),
                    );
                  case NewsListPageError _:
                    return const Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.search_off,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Sorry we cannot find your news',
                          ),
                        ],
                      ),
                    );
                  default:
                    return const Center(
                      child: Text('unknown'),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void onSearchTextChanged(
      BuildContext context, String keyword, Timer? debounce) {
    if (keyword.isEmpty) {
      context.read<NewsListBloc>().add(
            NewsListFetchSuggestionEvent('us', 4),
          );
      return;
    }

    if (keyword.isNotEmpty && keyword.length < 3) {
      context.read<NewsListBloc>().add(
            NewsListPageSearchKeywordMinimumErrorEvent(),
          );
      return;
    }

    if (debounce?.isActive == true) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<NewsListBloc>().add(
            NewsListFetchSearchNewsEvent(keyword, null, 15),
          );
    });
  }
}
