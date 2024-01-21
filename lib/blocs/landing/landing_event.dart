part of 'landing_bloc.dart';

@immutable
abstract class LandingEvent {}

class LandingFetchDataEvent extends LandingEvent {
  final String countryCode;
  LandingFetchDataEvent(this.countryCode);
}