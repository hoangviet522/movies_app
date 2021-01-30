import 'package:dartz/dartz.dart';
import 'package:mygarment/data/data_sources/movie_remote_data_source.dart';
import 'package:mygarment/data/models/movie_model.dart';
import 'package:mygarment/data/models/video_model.dart';
import 'package:mygarment/domain/entities/app_error.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';
import 'package:mygarment/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on Exception {
      return Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    } on Exception {
      return Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getCommingSoon() async {
    try {
      final movies = await remoteDataSource.getCommingSoon();
      return Right(movies);
    } on Exception {
      return Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getTopRated() async {
    try {
      final movies = await remoteDataSource.getTopRated();
      return Right(movies);
    } on Exception {
      return Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies);
    } on Exception {
      return Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, MovieEntity>> getMovieDetail(int id) async {
    try {
      final movie = await remoteDataSource.getMovieDetail(id);
      return Right(movie);
    } on Exception {
      return Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<VideoModel>>> getVideoMovie(int id) async {
    try {
      final video = await remoteDataSource.getVideoMovie(id);
      return Right(video);
    } on Exception {
      return Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getSimilarMovie(int id) async {
    try {
      final similarMovie = await remoteDataSource.getSimilarMovie(id);
      return Right(similarMovie);
    } on Exception {
      return Left(AppError('Something went wrong'));
    }
  }
}
