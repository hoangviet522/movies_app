import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

class CategoryHorizontalCardWidget extends StatelessWidget {
  final String id;
  final String backgroundPath;
  final String title;

  const CategoryHorizontalCardWidget({
    Key key,
    @required this.id,
    @required this.backgroundPath,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: backgroundPath,
              errorWidget: (context, url, error) =>
                  Image.asset('assets/pngs/category_background.png'),
            ),
          ),
          Container(
            width: Sizes.dimen_200.w,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: Sizes.dimen_12.h, left: Sizes.dimen_12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context).textTheme.boldSubtitle1.copyWith(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    '8 Topics',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.white,
                        ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
