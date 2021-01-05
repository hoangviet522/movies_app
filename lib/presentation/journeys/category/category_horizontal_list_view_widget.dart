import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/domain/entities/category_entity.dart';
import '../../../common/extensions/size_extensions.dart';
import 'category-horizontal_card_widget.dart';

class CategoryHorizontalListViewWidget extends StatelessWidget {
  final List<CategoryEntity> categories;

  const CategoryHorizontalListViewWidget({Key key, @required this.categories})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Sizes.padding_vertical.h, bottom: Sizes.padding_vertical.h),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: Sizes.padding_horizontal.w);
        },
        itemBuilder: (context, index) {
          final CategoryEntity cate = categories[index];
          return CategoryHorizontalCardWidget(
            id: cate.id,
            title: cate.title,
            backgroundPath: cate.backgroundPath,
          );
        },
      ),
    );
  }
}
