import 'package:mygarment/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';
import 'package:mygarment/domain/entities/movie_params.dart';
import 'package:mygarment/domain/entities/video_entity.dart';
import 'package:mygarment/domain/repositories/movie_repository.dart';
import 'package:mygarment/domain/usecases/usecase.dart';

class GetVideoMovie extends UseCase<List<VideoEntity>, MovieParams> {
  final MovieRepository movieRepository;

  GetVideoMovie(this.movieRepository);
  @override
  Future<Either<AppError, List<VideoEntity>>> call(MovieParams params) async {
    return await movieRepository.getVideoMovie(params.id);
  }
}
