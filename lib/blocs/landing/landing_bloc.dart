import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusapp/blocs/repo/landing_repo_imp.dart';
import 'package:nusapp/models/decodable/news_response.dart';
import 'package:nusapp/models/viewmodel/news_model.dart';

part 'landing_event.dart';

part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  final landingRepo = LandingRepoImp();

  LandingBloc() : super(LandingInitial()) {
    on<LandingFetchDataEvent>(_fetchNewsList);
  }

  FutureOr<void> _fetchNewsList(LandingEvent event, Emitter<LandingState> emit) async {
    if (event is LandingFetchDataEvent) {
      emit(LandingLoading());

      await landingRepo
      .getNewsData(event.countryCode)
      .then((value) {
        NewsResponse response = NewsResponse.fromJson(value);
        if (response.articles.isEmpty == false) {
          emit(LandingPageLoaded(response.toViewModel().articles));
        } else {
          emit(LandingPageError('bahlul'));
        }
      });
    }
  }
}