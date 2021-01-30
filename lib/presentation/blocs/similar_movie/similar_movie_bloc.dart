import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';
import 'package:mygarment/domain/entities/movie_params.dart';
import 'package:mygarment/domain/usecases/get_similar_movie.dart';

part 'similar_movie_event.dart';
part 'similar_movie_state.dart';

class SimilarMovieBloc extends Bloc<SimilarMovieEvent, SimilarMovieState> {
  final GetSimilarMovie getSimilarMovie;
  SimilarMovieBloc({@required this.getSimilarMovie})
      : super(SimilarMovieInitial());

  @override
  Stream<SimilarMovieState> mapEventToState(
    SimilarMovieEvent event,
  ) async* {
    if (event is SimilarMovieLoadEvent) {
      yield SimilarMovieLoading();
      final similarMovieEither = await getSimilarMovie(MovieParams(event.id));
      yield similarMovieEither.fold(
        (l) => SimilarMovieError(),
        (similarMovie) {
          // print(similarMovie);
          return SimilarMovieLoaded(similarMovie);
        },
      );
    }
  }
}
