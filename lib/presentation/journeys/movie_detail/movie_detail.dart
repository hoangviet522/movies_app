import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/presentation/journeys/movie_detail/movie_detail_app_bar.dart';
import 'package:mygarment/presentation/journeys/movie_detail/movie_detail_content.dart';
import 'package:mygarment/presentation/journeys/side_bar_menu/navigation_sidebar.dart';
import 'package:mygarment/presentation/journeys/video_player/video_player_screen.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import 'package:mygarment/presentation/widgets/common_button.dart';
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
                  MovieDetailAppBar(),
                  SizedBox(
                    height: Sizes.dimen_150.h,
                  ),
                  MovieDetailContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
