import 'package:dartz/dartz.dart';
import 'package:mygarment/domain/entities/app_error.dart';
import 'package:mygarment/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<Either<AppError, List<CategoryEntity>>> getCategories();
}
