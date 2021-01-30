import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';
import 'package:mygarment/domain/entities/movie_params.dart';
import 'package:mygarment/domain/entities/no_params.dart';
import 'package:mygarment/domain/usecases/get_movie_detail.dart';
import 'package:mygarment/presentation/blocs/video_movie/video_movie_bloc.dart';
import 'package:mygarment/presentation/journeys/movie_detail/movie_detail.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final VideoMovieBloc videoMovieBloc;

  MovieDetailBloc(
      {@required this.getMovieDetail, @required this.videoMovieBloc})
      : super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    if (event is MovieDetailLoadEvent) {
      yield MovieDetailLoading();
      final movieDetailEither = await getMovieDetail(MovieParams(event.id));
      yield movieDetailEither.fold(
          (l) => MovieDetailError(), (r) => MovieDetailLoaded(r));
      videoMovieBloc.add(VideoMovieLoadEvent(event.id));
    }
  }
}
