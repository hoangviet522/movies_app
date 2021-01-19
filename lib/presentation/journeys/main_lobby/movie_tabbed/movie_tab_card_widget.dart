import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/data/models/movie.dart';

import '../../../themes/theme_text.dart';
import '../../../../common/extensions/size_extensions.dart';

class MovieTabCardWidget extends StatelessWidget {
  final Movie movie;

  const MovieTabCardWidget({Key key, this.movie}) : super(key: key);
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
              child: Image(
                image: AssetImage(movie.poster),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Sizes.dimen_4.h),
            child: Text(
              // title.intelliTrim(),
              movie.title,
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
