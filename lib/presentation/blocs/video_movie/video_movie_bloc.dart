import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';
import 'package:mygarment/domain/entities/movie_params.dart';
import 'package:mygarment/domain/entities/video_entity.dart';
import 'package:mygarment/domain/usecases/get_video_movie.dart';

part 'video_movie_event.dart';
part 'video_movie_state.dart';

class VideoMovieBloc extends Bloc<VideoMovieEvent, VideoMovieState> {
  final GetVideoMovie getVideoMovie;

  VideoMovieBloc({@required this.getVideoMovie}) : super(VideoMovieInitial());

  @override
  Stream<VideoMovieState> mapEventToState(
    VideoMovieEvent event,
  ) async* {
    if (event is VideoMovieLoadEvent) {
      yield VideoMovieLoading();
      // print("Iddd ${event.id}");
      final videoMovieEither = await getVideoMovie(MovieParams(event.id));
      // print(videoMovieEither);
      yield videoMovieEither.fold(
        (l) => VideoMovieError(),
        (video) {
          print(video);
          return VideoMovieLoaded(video);
        },
      );
    }
  }
}
