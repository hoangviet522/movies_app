import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/domain/entities/category_entity.dart';
import '../../../common/extensions/size_extensions.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    Key key,
    @required this.item,
  }) : super(key: key);

  final CategoryEntity item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Sizes.dimen_12.w, vertical: Sizes.dimen_6.h),
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 8,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              // height: 120,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: item.backgroundPath,
                      errorWidget: (context, url, error) =>
                          Image.asset('assets/pngs/topic_default.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      item.lock != true ? 'Free' : "Paired",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Sizes.dimen_4.h,
            ),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            )
          ],
        ),
      ),
    );
  }
}
