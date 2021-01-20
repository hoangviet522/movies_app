import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/data/models/movie.dart';
import 'package:mygarment/presentation/journeys/search_screen/list_card.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import 'package:mygarment/presentation/widgets/common_button.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Movie movie;
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        body: Container(
          // height: ScreenUtil.screenHeight,
          // width: ScreenUtil.screenWidth,
          color: Color(0xFF131221),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: Sizes.dimen_22.h,
                  left: Sizes.dimen_20.w,
                  right: Sizes.dimen_20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/share.svg',
                      height: Sizes.dimen_8.h,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: Sizes.dimen_16.w,
                    ),
                    SvgPicture.asset(
                      'assets/svgs/add.svg',
                      height: Sizes.dimen_8.h,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Sizes.dimen_10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.dimen_20.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Sizes.dimen_16.h,
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          fillColor: Colors.white.withOpacity(0.1),
                          filled: true,
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(Sizes.dimen_32.w),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          // focusColor: AppColor.violet,
                          // focusedBorder: AppColor.violet,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(Sizes.dimen_32.w),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          // enabledBorder: Colors.white,
                          hintText: "Type Your Movie Name",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Sizes.dimen_10.h,
                    ),
                    Text(
                      "Your Favorite Movies",
                      style: Theme.of(context).textTheme.whiteBoldHeadline5,
                    ),
                    SizedBox(
                      height: Sizes.dimen_2.h,
                    ),
                    Text(
                      "Swipe Card To Watch",
                      style: Theme.of(context).textTheme.violetSubtitle2,
                    ),
                    SizedBox(
                      height: Sizes.dimen_12.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: Sizes.dimen_20.w,
                      ),
                      height: Sizes.dimen_140.h,
                      width: ScreenUtil.screenWidth,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return ListCard(movie: movies[index]);
                        },
                        itemCount: movies.length,
                        itemWidth: ScreenUtil.screenWidth * 0.7,
                        layout: SwiperLayout.STACK,
                      ),
                    ),
                    SizedBox(
                      height: Sizes.dimen_6.h,
                    ),
                    Text(
                      "MARCH 8, 2019 (TURKEY)",
                      style: Theme.of(context).textTheme.whiteOpacitySubtitle2,
                    ),
                    SizedBox(
                      height: Sizes.dimen_8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    CommonButton(
                      text: "Watch It",
                      colorStart: AppColor.royalBlue,
                      colorEnd: AppColor.violet,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
