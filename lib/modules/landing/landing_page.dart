import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusapp/blocs/landing/landing_bloc.dart';
import 'package:nusapp/blocs/newslist/news_list_bloc.dart';
import 'package:nusapp/modules/landing/views/landing_header_widget.dart';
import 'package:nusapp/modules/landing/views/landing_main_news_tile_widget.dart';
import 'package:nusapp/modules/landing/views/landing_news_item_list_widget.dart';
import 'package:nusapp/modules/newslist/news_list_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LandingBloc, LandingState>(listener: (context, state) {
        switch (state) {
          case LandingNavigateToNewsListState _:
            gotoList(context);
        }
      }, buildWhen: (prev, current) {
        return current is! LandingNavigateToNewsListState;
      }, builder: (context, state) {
        switch (state) {
          case LandingInitial _:
            context.read<LandingBloc>().add(LandingFetchDataEvent("us"));
            return const Center(
              child: Text('initial state'),
            );
          case LandingPageError _:
            return const Center(
              child: Text('error load news'),
            );
          case LandingLoading _:
            return const Center(
              child: Text('loading'),
            );
          case LandingPageLoaded _:
            final viewModel = state.data;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 450,
                  title: LandingHeaderWidget(
                    onSearchTap: () {
                      context
                          .read<LandingBloc>()
                          .add(LandingNavigateToNewsListEvent());
                    },
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      padding: const EdgeInsets.only(top: 90),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          if (viewModel.headline != null) ...[
                            LandingMainNewsTileWidget(viewModel.headline!),
                          ],
                        ],
                      ),
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
                      return LandingNewsItemListWidget(
                          viewModel.otherArticles[index]);
                    }, childCount: viewModel.otherArticles.length),
                    itemExtent: 80)
              ],
            );
          default:
            return const Center(
              child: Text('unknown state'),
            );
        }
      }),
    );
  }

  void gotoList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<NewsListBloc>(
                create: (context) => NewsListBloc()
                  ..add(
                    NewsListFetchSuggestionEvent(null, 4),
                  ),
              )
            ],
            child: const NewsListPage(),
          );
        },
      ),
    );
  }
}
