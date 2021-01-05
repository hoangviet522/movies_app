import 'package:dartz/dartz.dart';
import 'package:mygarment/data/core/hive_service.dart';
import 'package:mygarment/data/remote_data_sources/category_remote_data_source.dart';
import 'package:mygarment/data/tables/category_table.dart';
import 'package:mygarment/domain/entities/app_error.dart';
import 'package:mygarment/domain/entities/category_entity.dart';
import 'package:mygarment/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;
  final HiveService hiveService;

  CategoryRepositoryImpl({this.remoteDataSource, this.hiveService});

  @override
  Future<Either<AppError, List<CategoryEntity>>> getCategories() async {
    List<CategoryTable> hiveCategories = [];
    // await hiveService.clearAllBox('categories');
    bool exists = await hiveService.isExists(boxName: "categories");
    if (exists) {
      final categories =
          await hiveService.getBoxes<CategoryEntity>("categories");
      return Right(categories);
    } else {
      try {
        final categories = await remoteDataSource.getListCategories();
        categories.forEach((element) {
          hiveCategories.add(new CategoryTable.fromJson(element));
        });
        await hiveService.addBoxes(hiveCategories, "categories");
        return Right(categories);
      } on Exception {
        return Left(AppError('Something went wrong'));
      }
    }
  }
}
