part of 'news_list_bloc.dart';

@immutable
abstract class NewsListState {}

class NewsListInitial extends NewsListState {}

class NewsListLoading extends NewsListState {}

class NewsListPageLoaded extends NewsListState {
  late final NewsListViewModel data;

  NewsListPageLoaded(this.data);
}

class NewsListPageError extends NewsListState {
  late final String errorMessage;

  NewsListPageError(this.errorMessage);
}

class NewsListPageSearchKeywordMinimumErrorState extends NewsListState {}