part of 'landing_bloc.dart';

abstract class LandingState {}

class LandingInitial extends LandingState {}

class LandingLoading extends LandingState {}

class LandingArticleLoaded extends LandingState {
  late final List<Article> articles;

  LandingArticleLoaded(this.articles);
}

class LandingError extends LandingState {
  late final String errorMessage;

  LandingError(this.errorMessage);
}
