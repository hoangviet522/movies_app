part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailError extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieEntity movie;

  MovieDetailLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}
