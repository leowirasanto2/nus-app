import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusapp/common/repo/newslist/news_list_imp.dart';
import 'package:nusapp/models/decodable/news_response.dart';
import 'package:nusapp/models/viewmodel/news_list_view_model.dart';

part 'news_list_event.dart';

part 'news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  final newsListRepo = NewsListRepoImp();

  NewsListBloc() : super(NewsListInitial()) {
    on<NewsListFetchDataEvent>(_fetchNewsList);
  }

  FutureOr<void> _fetchNewsList(
      NewsListEvent event, Emitter<NewsListState> emit) async {
    if (event is NewsListFetchDataEvent) {
      emit(NewsListLoading());

      await newsListRepo.getNewsList(event.countryCode).then((value) {
        NewsResponse response = NewsResponse.fromJson(value);
        if (response.articles.isEmpty) {
          emit(NewsListPageLoaded(response.toNewsListViewModel()));
        } else {
          emit(NewsListPageError('ente bahlul'));
        }
      });
    }
  }
}
