import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/domain/entities/category_entity.dart';
import 'package:mygarment/presentation/widgets/app_bar_widget.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../common/extensions/string_extensions.dart';
import '../../themes/theme_text.dart';
import 'category_card_widget.dart';

class CategoryScreen extends StatelessWidget {
  final List<CategoryEntity> categories;

  const CategoryScreen({Key key, this.categories}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: TranslationConstants.category.t(context)),
      body: Container(
        padding: EdgeInsets.only(
          left: Sizes.padding_horizontal.w,
          right: Sizes.padding_horizontal.w,
          top: Sizes.padding_vertical.h * 2,
        ),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            CategoryEntity item = categories[index];
            return CategoryCardWidget(item: item);
          },
        ),
      ),
    );
  }
}
