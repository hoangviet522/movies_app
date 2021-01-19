import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import '../../../themes/theme_text.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import '../../../../common/extensions/size_extensions.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedCategory = 0;
  List<String> categories = ["Now Showing", "Coming Soon"];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_2.h),
      height: Sizes.dimen_14.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index, context),
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_14.w),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: Theme.of(context).textTheme.boldSubtitle2.copyWith(
                    fontWeight: FontWeight.w600,
                    color: index == selectedCategory
                        ? Colors.black
                        : Colors.black.withOpacity(0.6),
                  ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: Sizes.dimen_1.h),
              height: 6,
              width: Sizes.dimen_32.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == selectedCategory
                    ? Colors.orangeAccent
                    : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
