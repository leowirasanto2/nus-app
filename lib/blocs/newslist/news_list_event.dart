part of 'news_list_bloc.dart';

@immutable
abstract class NewsListEvent {}

class NewsListFetchDataEvent extends NewsListEvent {
  final String countryCode;
  NewsListFetchDataEvent(this.countryCode);
}