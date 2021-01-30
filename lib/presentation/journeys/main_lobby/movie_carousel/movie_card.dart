import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/data/core/api_constants.dart';
import 'package:mygarment/data/models/movie.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';
import 'package:mygarment/presentation/journeys/movie_detail/movie_detail.dart';

import '../../../themes/theme_text.dart';
import '../../../../common/extensions/size_extensions.dart';

class MovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const MovieCardWidget({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MovieDetail(
                id: movie.id,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            Sizes.dimen_16.w,
          ),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
