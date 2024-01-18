part of 'landing_bloc.dart';

abstract class LandingEvent {}

class LandingFetchArticlEvent extends LandingEvent {
  final String countryCode;

  LandingFetchArticlEvent(this.countryCode);
}

class SelectArticle extends LandingEvent {
  final Article article;
  SelectArticle({required this.article});
}
