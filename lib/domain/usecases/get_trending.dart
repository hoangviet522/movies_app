import 'package:dartz/dartz.dart';
import 'package:mygarment/domain/entities/app_error.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';
import 'package:mygarment/domain/entities/no_params.dart';
import 'package:mygarment/domain/repositories/movie_repository.dart';
import 'package:mygarment/domain/usecases/usecase.dart';

class GetTrending extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetTrending(this.repository);

  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getTrending();
  }
}
