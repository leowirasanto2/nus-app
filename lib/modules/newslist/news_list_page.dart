import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusapp/blocs/newslist/news_list_bloc.dart';
import 'package:nusapp/modules/landing/views/landing_news_item_list_widget.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchAnchor(
          builder: (context, controller) {
            return SearchBar(
              onSubmitted: (text) {
                context.read<NewsListBloc>().add(
                      NewsListFetchSearchNewsEvent(text, null, 15),
                    );
              },
              controller: controller,
              hintText: 'type here to search news',
              leading: const Icon(Icons.search),
              onChanged: (text) {
                print(text);
              },
            );
          },
          suggestionsBuilder: (context, controller) {
            return List<ListTile>.generate(5, (int index) {
              final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  print('suggestion tapped');
                },
              );
            });
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
                      child: Text('loading'),
                    );
                  case NewsListPageLoaded _:
                    return Container(
                      padding: const EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        itemCount: state.data.newsList.length,
                        itemExtent: 80,
                        itemBuilder: (context, index) {
                          return LandingNewsItemListWidget(
                              state.data.newsList[index]);
                        },
                      ),
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
          ),
        ],
      ),
    );
  }
}
