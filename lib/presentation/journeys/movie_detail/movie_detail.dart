import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/presentation/journeys/side_bar_menu/navigation_sidebar.dart';
import 'package:mygarment/presentation/journeys/video_player/video_player_screen.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import 'package:mygarment/presentation/widgets/movie_app_bar.dart';
import '../../../common/extensions/size_extensions.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import '../../themes/theme_text.dart';

class MovieDetail extends StatefulWidget {
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationSidebar(),
      body: Container(
        child: Stack(
          // fit: StackFit.expand,
          children: [
            Container(
              height: ScreenUtil.defaultHeight * 0.65,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/jpgs/signin_bg.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Sizes.dimen_24.h,
                left: Sizes.dimen_32.w,
                right: Sizes.dimen_32.w,
              ),
              height: ScreenUtil.screenHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.1,
                      0.6,
                      0.9,
                      1
                    ],
                    colors: [
                      Color(0xFFF97474).withOpacity(0.1),
                      Color(0xFF5E2D3F),
                      Color(0xFF0B0623),
                      Color(0xFF07031C),
                    ]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SvgPicture.asset(
                            'assets/svgs/menu.svg',
                            height: Sizes.dimen_10.h,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SvgPicture.asset(
                            'assets/svgs/cancel.svg',
                            height: Sizes.dimen_10.h,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Sizes.dimen_150.h,
                  ),
                  Column(
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
                        style:
                            Theme.of(context).textTheme.whiteOpacitySubtitle2,
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
                        style:
                            Theme.of(context).textTheme.whiteOpacitySubtitle2,
                      ),
                      SizedBox(
                        height: Sizes.dimen_24.h,
                      ),
                      Container(
                        width: ScreenUtil.screenWidth,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.dimen_20.w),
                          gradient: new LinearGradient(
                            // colors: [Colors.blueGrey, Colors.grey],
                            colors: [AppColor.royalBlue, AppColor.violet],

                            begin: FractionalOffset.centerLeft,
                            end: FractionalOffset.centerRight,
                          ),
                        ),
                        child: FlatButton(
                          child: new Text(
                            'Watch It',
                            style:
                                Theme.of(context).textTheme.whiteBoldSubtitle1,
                          ),
                          onPressed: () {
                            // Navigator.pushNamed(context, HomeScreen);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    VideoPlayerScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
