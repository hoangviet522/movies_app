part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  const MovieTabbedState({this.currentTabIndex});
  final int currentTabIndex;

  @override
  List<Object> get props => [];
}

class MovieTabbedInitial extends MovieTabbedState {}

class MovieTabChanged extends MovieTabbedState {
  final List<MovieEntity> movies;

  MovieTabChanged({int currentTabIndex, this.movies})
      : super(currentTabIndex: currentTabIndex);
  @override
  List<Object> get props => [currentTabIndex, movies];
}

class MovieTabLoadError extends MovieTabbedState {
  const MovieTabLoadError({int currentTabIndex})
      : super(currentTabIndex: currentTabIndex);
}
