import 'package:dartz/dartz.dart';
import 'package:mygarment/domain/entities/app_error.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';
import 'package:mygarment/domain/entities/movie_params.dart';
import 'package:mygarment/domain/repositories/movie_repository.dart';
import 'package:mygarment/domain/usecases/usecase.dart';

class GetSimilarMovie extends UseCase<List<MovieEntity>, MovieParams> {
  final MovieRepository movieRepository;

  GetSimilarMovie(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(MovieParams params) async {
    return await movieRepository.getSimilarMovie(params.id);
  }
}
