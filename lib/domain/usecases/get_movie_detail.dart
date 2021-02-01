// class GetTopicsByCategory extends UseCase<List<TopicEntity>, TopicParams> {
//   final TopicRepository repository;

//   GetTopicsByCategory(this.repository);
//   @override
//   Future<Either<AppError, List<TopicEntity>>> call(TopicParams params) async {
//     return await repository.getTopicsByCategory(params.id);
//   }
// }
import 'package:dartz/dartz.dart';
import 'package:mygarment/domain/entities/app_error.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';
import 'package:mygarment/domain/entities/movie_params.dart';
import 'package:mygarment/domain/repositories/movie_repository.dart';
import 'package:mygarment/domain/usecases/usecase.dart';

class GetMovieDetail extends UseCase<MovieEntity, MovieParams> {
  final MovieRepository movieRepository;

  GetMovieDetail(this.movieRepository);
  @override
  Future<Either<AppError, MovieEntity>> call(MovieParams params) async {
    return await movieRepository.getMovieDetail(params.id);
  }
}
