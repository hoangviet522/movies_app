import 'package:mygarment/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:mygarment/domain/entities/no_params.dart';
import 'package:mygarment/domain/entities/category_entity.dart';
import 'package:mygarment/domain/repositories/category_repository.dart';
import 'package:mygarment/domain/usecases/usecase.dart';

class GetCategories extends UseCase<List<CategoryEntity>, NoParams> {
  final CategoryRepository categoryRepository;

  GetCategories(this.categoryRepository);
  @override
  Future<Either<AppError, List<CategoryEntity>>> call(NoParams params) async {
    return await categoryRepository.getCategories();
  }
}
