part of 'similar_movie_bloc.dart';

abstract class SimilarMovieState extends Equatable {
  const SimilarMovieState();

  @override
  List<Object> get props => [];
}

class SimilarMovieInitial extends SimilarMovieState {}

class SimilarMovieLoading extends SimilarMovieState {}

class SimilarMovieError extends SimilarMovieState {}

class SimilarMovieLoaded extends SimilarMovieState {
  final List<MovieEntity> similarMovie;

  SimilarMovieLoaded(this.similarMovie);

  @override
  List<Object> get props => [similarMovie];
}
