part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class MovieDetailLoadEvent extends MovieDetailEvent {
  final int id;

  MovieDetailLoadEvent(this.id);

  @override
  List<Object> get props => [id];
}
