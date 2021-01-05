import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/domain/entities/category_entity.dart';
import 'package:mygarment/presentation/journeys/category/category_horizontal_list_view_widget.dart';
import 'package:mygarment/presentation/journeys/category/category_screen.dart';
import '../../themes/theme_text.dart';
import '../../../common/extensions/string_extensions.dart';

class CategoryCarouselWidget extends StatelessWidget {
  final List<CategoryEntity> categories;

  const CategoryCarouselWidget({Key key, this.categories}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(TranslationConstants.category.t(context),
                style: Theme.of(context).textTheme.boldSubtitle1),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        CategoryScreen(categories: categories)));
              },
              child: Text(
                TranslationConstants.viewAll.t(context),
              ),
            ),
          ],
        ),
        Expanded(
          child: CategoryHorizontalListViewWidget(
            categories: categories,
          ),
        )
      ],
    );
  }
}
