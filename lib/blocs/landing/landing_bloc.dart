import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusapp/blocs/repo/landing_repo.dart';
import 'package:nusapp/models/viewmodel/news_model.dart';

part 'landing_event.dart';
part 'landing_state.dart';

 class LandingBloc extends Bloc<LandingEvent, LandingState> {
   final _landingRepo = LandingRepo();

   LandingBloc() : super(LandingInitial()) {
     on<LandingFetchArticlEvent>(_fetchArticleList);
   }

   FutureOr<void> _fetchArticleList(LandingEvent event, Emitter<LandingState> emitter) async {
     if (event is LandingFetchArticlEvent) {
        emitter(LandingLoading());
        await _landingRepo
        .getLandingArticles('us')
        .onError((error, stackTrace) => emitter(LandingError(error.toString())))
        .then((value) => {

        });
     }
   }
 }