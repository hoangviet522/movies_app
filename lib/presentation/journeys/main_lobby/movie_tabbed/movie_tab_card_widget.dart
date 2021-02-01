import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/data/core/api_constants.dart';
import 'package:mygarment/data/models/movie.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';

import '../../../themes/theme_text.dart';
import '../../../../common/extensions/size_extensions.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int index;
  final String title, posterPath;

  const MovieTabCardWidget({Key key, this.index, this.title, this.posterPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(movie.genra);
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                Sizes.dimen_16.w,
              ),
              // child: Image(
              //   image: AssetImage(),
              // ),
              child: CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}${posterPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Sizes.dimen_4.h),
            child: Text(
              // title.intelliTrim(),
              title,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.whiteOpacitySubtitle2,
            ),
          ),
        ],
      ),
    );
  }
}
