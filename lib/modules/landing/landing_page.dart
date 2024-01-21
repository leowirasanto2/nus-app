import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusapp/blocs/landing/landing_bloc.dart';
import 'package:nusapp/modules/landing/views/landing_header_widget.dart';
import 'package:nusapp/modules/landing/views/landing_main_news_tile_widget.dart';
import 'package:nusapp/modules/landing/views/landing_news_list_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LandingBloc landingBloc = BlocProvider.of(context);
    landingBloc.add(LandingFetchDataEvent('us'));

    return Scaffold(
      body: BlocBuilder<LandingBloc, LandingState>(builder: (context, state) {
        if (state is LandingLoading) {
          return const Center(
            child: Text('loading'),
          );
        } else if (state is LandingPageError) {
          return const Center(
            child: Text('error load news'),
          );
        } else if (state is LandingPageLoaded) {
          final viewModel = state.data;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: false,
                expandedHeight: 470,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      const LandingHeaderWidget(),
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
              const SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
              ),
              SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return LandingNewsListWidget(
                        viewModel.otherArticles[index]);
                  }, childCount: viewModel.otherArticles.length),
                  itemExtent: 80)
            ],
          );
        } else {
          return const Center(
            child: Text('unknown state'),
          );
        }
      }),
    );
  }
}
