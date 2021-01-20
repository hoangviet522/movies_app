import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/presentation/journeys/video_player/video_player_screen.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import 'package:mygarment/presentation/widgets/common_button.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Captain Marvel",
              style: Theme.of(context).textTheme.whiteHeadline6,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/svgs/star.svg",
                  height: 16,
                  color: AppColor.violet,
                ),
                SizedBox(
                  width: Sizes.dimen_8.w,
                ),
                SvgPicture.asset(
                  "assets/svgs/star.svg",
                  height: 16,
                  color: AppColor.violet,
                ),
                SizedBox(
                  width: Sizes.dimen_8.w,
                ),
                SvgPicture.asset(
                  "assets/svgs/star.svg",
                  height: 16,
                  color: AppColor.violet,
                ),
                SizedBox(
                  width: Sizes.dimen_8.w,
                ),
                SvgPicture.asset(
                  "assets/svgs/star.svg",
                  height: 16,
                  color: AppColor.violet,
                ),
                SizedBox(
                  width: Sizes.dimen_8.w,
                ),
                SvgPicture.asset(
                  "assets/svgs/star_outline.svg",
                  height: 16,
                  color: AppColor.violet,
                ),
              ],
            ),
          ],
        ),
        Text(
          "MARCH 8, 2019 (TURKEY)",
          style: Theme.of(context).textTheme.whiteOpacitySubtitle2,
        ),
        SizedBox(
          height: Sizes.dimen_10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Action  |  Crime  |  Drama  |  Mystery",
              style: TextStyle(color: AppColor.violet),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "108",
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
        Text(
          "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s and finds a formidable foe by the name of the Cheetah.",
          style: Theme.of(context).textTheme.whiteOpacitySubtitle2,
        ),
        SizedBox(
          height: Sizes.dimen_24.h,
        ),
        CommonButton(
          text: "Watch It",
          colorStart: AppColor.royalBlue,
          colorEnd: AppColor.violet,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => VideoPlayerScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
