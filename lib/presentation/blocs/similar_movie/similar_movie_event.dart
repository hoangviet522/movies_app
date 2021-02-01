part of 'similar_movie_bloc.dart';

abstract class SimilarMovieEvent extends Equatable {
  const SimilarMovieEvent();

  @override
  List<Object> get props => [];
}

class SimilarMovieLoadEvent extends SimilarMovieEvent {
  final int id;

  SimilarMovieLoadEvent(this.id);

  @override
  List<Object> get props => [id];
}
