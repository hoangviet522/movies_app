import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/data/models/movie.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import 'package:mygarment/presentation/widgets/common_button.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

class ListFilmCard extends StatelessWidget {
  final Movie movie;

  const ListFilmCard({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_48.h,
      width: ScreenUtil.screenWidth,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 0.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(movie.poster),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: 0.5,
            child: Padding(
              padding: EdgeInsets.only(left: Sizes.dimen_10.w),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: Theme.of(context).textTheme.royalBlueSubtitle2,
                      ),
                      SizedBox(
                        height: Sizes.dimen_1.h,
                      ),
                      Text(
                        movie.releaseDate,
                        style:
                            Theme.of(context).textTheme.whiteOpacitySubtitle2,
                      ),
                      SizedBox(
                        height: Sizes.dimen_2.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            movie.movieLength,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            // style: Theme.of(context).textTheme.whiteHeadline6,
                          ),
                          SizedBox(
                            width: Sizes.dimen_6.w,
                          ),
                          Text(
                            "min",
                            style: Theme.of(context).textTheme.violetSubtitle2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  CommonButton(
                    height: Sizes.dimen_12.h,
                    text: "Watch Trailer",
                    colorStart: AppColor.royalBlue,
                    colorEnd: AppColor.violet,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
