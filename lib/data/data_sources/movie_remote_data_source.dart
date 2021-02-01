import 'package:mygarment/data/core/api_client.dart';
import 'package:mygarment/data/models/movie_model.dart';
import 'package:mygarment/data/models/movies_result_model.dart';
import 'package:mygarment/data/models/video_model.dart';
import 'package:mygarment/data/models/video_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getCommingSoon();
  Future<List<MovieModel>> getTopRated();
  Future<MovieModel> getMovieDetail(int id);
  Future<List<VideoModel>> getVideoMovie(int id);
  Future<List<MovieModel>> getSimilarMovie(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;
  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getCommingSoon() async {
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final response = await _client.get('movie/top_rated');
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<MovieModel> getMovieDetail(int id) async {
    final response = await _client.get('movie/${id}');
    final movie = MovieModel.fromJson(response);
    return movie;
  }

  @override
  Future<List<VideoModel>> getVideoMovie(int id) async {
    final response = await _client.get('movie/${id}/videos');
    final video = VideosResultModel.fromJson(response).videos;
    return video;
  }

  @override
  Future<List<MovieModel>> getSimilarMovie(int id) async {
    final response = await _client.get('movie/${id}/similar');
    final similarMovie = MoviesResultModel.fromJson(response).movies;
    return similarMovie;
  }
}
