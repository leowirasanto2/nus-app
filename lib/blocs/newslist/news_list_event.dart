part of 'news_list_bloc.dart';

@immutable
abstract class NewsListEvent {}

class NewsListFetchDataEvent extends NewsListEvent {
  final String countryCode;

  NewsListFetchDataEvent(this.countryCode);
}

class NewsListFetchSearchNewsEvent extends NewsListEvent {
  final String keyword;
  final String? countryCode;
  final int pageSize;

  NewsListFetchSearchNewsEvent(this.keyword, this.countryCode, this.pageSize);
}

class NewsListFetchSuggestionEvent extends NewsListEvent {
  final String? countryCode;
  final int pageSize;

  NewsListFetchSuggestionEvent(this.countryCode, this.pageSize);
}

class NewsListPageSearchKeywordMinimumErrorEvent extends NewsListEvent {}