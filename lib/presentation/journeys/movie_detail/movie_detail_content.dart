import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';
import 'package:mygarment/presentation/journeys/video_player/video_player_screen.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import 'package:mygarment/presentation/widgets/common_button.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieEntity movie;

  const MovieDetailContent({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(movie.voteAverage);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                movie.title,
                style: Theme.of(context).textTheme.whiteHeadline6,
              ),
            ),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: movie.voteAverage / 2,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding:
                      EdgeInsets.symmetric(horizontal: Sizes.dimen_2.w),
                  itemBuilder: (context, index) => SvgPicture.asset(
                    "assets/svgs/star.svg",
                    color: AppColor.violet,
                  ),
                  itemSize: Sizes.dimen_16,
                  onRatingUpdate: null,
                ),
              ],
            ),
          ],
        ),
        Text(
          // "MARCH 8, 2019 (TURKEY)",
          movie.releaseDate,
          style: Theme.of(context).textTheme.whiteOpacitySubtitle2,
        ),
        SizedBox(
          height: Sizes.dimen_10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (var i = 0; i < movie.genres.length; i++)
              Text(
                // "Action  |  Crime  |  Drama  |  Mystery",
                movie.genres[i]['name'],
                style: TextStyle(color: AppColor.violet),
              ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  movie.runtime.toString(),
                  style: TextStyle(
                    color: AppColor.royalBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: Sizes.dimen_2.w,
                ),
                Text(
                  "min",
                  style: TextStyle(color: AppColor.royalBlue),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: Sizes.dimen_10.h,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Text(
              movie.overview,
              style: Theme.of(context).textTheme.whiteOpacitySubtitle2,
            ),
          ),
        ),
      ],
    );
  }
}
