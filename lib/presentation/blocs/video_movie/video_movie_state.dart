part of 'video_movie_bloc.dart';

abstract class VideoMovieState extends Equatable {
  const VideoMovieState();

  @override
  List<Object> get props => [];
}

class VideoMovieInitial extends VideoMovieState {}

class VideoMovieLoading extends VideoMovieState {}

class VideoMovieError extends VideoMovieState {}

class VideoMovieLoaded extends VideoMovieState {
  final List<VideoEntity> videoMovie;

  VideoMovieLoaded(this.videoMovie);

  @override
  List<Object> get props => [videoMovie];
}
