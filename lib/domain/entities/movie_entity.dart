import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final int id;
  final String backdropPath;
  final String title;
  final num voteAverage;
  final String releaseDate;
  final String overview;
  final int runtime;
  final List<int> genreIds;
  final String homepage;
  final List<dynamic> genres;
  final int key;

  const MovieEntity({
    @required this.posterPath,
    @required this.id,
    @required this.backdropPath,
    @required this.title,
    @required this.voteAverage,
    @required this.releaseDate,
    this.overview,
    this.runtime,
    this.genreIds,
    this.homepage,
    this.genres,
    this.key,
  }) : assert(id != null, 'Movie id must not be null');

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
