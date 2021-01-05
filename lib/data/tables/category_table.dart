import 'package:hive/hive.dart';
import 'package:mygarment/data/models/cagtegory_model.dart';
import 'package:mygarment/domain/entities/category_entity.dart';

part 'category_table.g.dart';

@HiveType(typeId: 0)
class CategoryTable extends CategoryEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String desc;
  @HiveField(3)
  final String background;
  @HiveField(4)
  final int order;
  @HiveField(5)
  final bool lock;

  CategoryTable(
      {this.id, this.title, this.desc, this.background, this.order, this.lock})
      : super(
          id: id,
          title: title,
          backgroundPath: background,
          lock: lock,
          order: order,
        );

  factory CategoryTable.fromJson(CategoryModel categoryModel) {
    return CategoryTable(
      id: categoryModel.id,
      title: categoryModel.title,
      background: categoryModel.background,
      desc: categoryModel.desc,
      order: categoryModel.order,
      lock: categoryModel.lock,
    );
  }
}
