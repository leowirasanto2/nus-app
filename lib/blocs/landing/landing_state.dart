part of 'landing_bloc.dart';

@immutable
abstract class LandingState {}

class LandingInitial extends LandingState {}

class LandingLoading extends LandingState {}

class LandingPageLoaded extends LandingState {
  late final List<Article> data;
  LandingPageLoaded(this.data);
}

class LandingPageError extends LandingState {
  late final String errorMessage;
  LandingPageError(this.errorMessage);
}