part of 'video_movie_bloc.dart';

abstract class VideoMovieEvent extends Equatable {
  const VideoMovieEvent();

  @override
  List<Object> get props => [];
}

class VideoMovieLoadEvent extends VideoMovieEvent {
  final int id;

  VideoMovieLoadEvent(this.id);

  @override
  List<Object> get props => [id];
}
