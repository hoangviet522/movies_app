import 'package:mygarment/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final int id;
  final bool video;
  final int voteCount;
  final double voteAverage;
  final String title;
  final String releaseDate;
  final String originalLanguage;
  final String originalTitle;
  final List<int> genreIds;
  final String backdropPath;
  final bool adult;
  final String overview;
  final String posterPath;
  final double popularity;
  final String mediaType;
  final int runtime;
  final List<dynamic> genres;
  final String homepage;
  final int key;
  // final List<dynamic> results;

  MovieModel({
    this.id,
    this.video,
    this.voteCount,
    this.voteAverage,
    this.title,
    this.releaseDate,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.posterPath,
    this.popularity,
    this.mediaType,
    this.runtime,
    this.genres,
    this.homepage,
    this.key,
  }) : super(
          id: id,
          title: title,
          backdropPath: backdropPath,
          posterPath: posterPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          overview: overview,
          runtime: runtime,
          genreIds: genreIds,
          homepage: homepage,
          genres: genres,
          key: key,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      video: json['video'],
      voteCount: json['vote_count'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      title: json['title'],
      releaseDate: json['release_date'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      genreIds: json['genre_ids']?.cast<int>(),
      backdropPath: json['backdrop_path'],
      adult: json['adult'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      popularity: json['popularity']?.toDouble() ?? 0.0,
      mediaType: json['media_type'],
      runtime: json['runtime'],
      genres: json['genres'],
      homepage: json['homepage'],
      key: json['key'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video'] = this.video;
    data['vote_count'] = this.voteCount;
    data['vote_average'] = this.voteAverage;
    data['title'] = this.title;
    data['release_date'] = this.releaseDate;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
    data['backdrop_path'] = this.backdropPath;
    data['adult'] = this.adult;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    data['runtime'] = this.runtime;
    data['genres'] = this.genres;
    data['homepage'] = this.homepage;
    data['key'] = this.key;
    return data;
  }
}
