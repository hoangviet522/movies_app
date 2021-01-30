import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mygarment/domain/entities/app_error.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';
import 'package:mygarment/domain/entities/no_params.dart';
import 'package:mygarment/domain/usecases/get_coming_soon.dart';
import 'package:mygarment/domain/usecases/get_playing_now.dart';
import 'package:mygarment/domain/usecases/get_top_rated.dart';
import 'package:mygarment/domain/usecases/get_trending.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  MovieTabbedBloc(
      {@required this.getTrending,
      @required this.getPlayingNow,
      @required this.getCommingSoon,
      @required this.getTopRated})
      : super(MovieTabbedInitial());

  final GetTrending getTrending;
  final GetPlayingNow getPlayingNow;
  final GetCommingSoon getCommingSoon;
  final GetTopRated getTopRated;

  @override
  Stream<MovieTabbedState> mapEventToState(
    MovieTabbedEvent event,
  ) async* {
    if (event is MovieTabChangedEvent) {
      Either<AppError, List<MovieEntity>> moviesEither;
      switch (event.currentTabIndex) {
        case 0:
          moviesEither = await getTrending(NoParams());
          break;
        case 1:
          moviesEither = await getPlayingNow(NoParams());
          break;
        case 2:
          moviesEither = await getCommingSoon(NoParams());
          break;
        case 3:
          moviesEither = await getTopRated(NoParams());
          break;
      }
      yield moviesEither.fold(
          (l) => MovieTabLoadError(currentTabIndex: event.currentTabIndex),
          (movies) {
        return MovieTabChanged(
            currentTabIndex: event.currentTabIndex, movies: movies);
      });
    }
  }
}
