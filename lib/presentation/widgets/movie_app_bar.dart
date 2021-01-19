import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/common/extensions/size_extensions.dart';
import 'package:mygarment/presentation/widgets/logo.dart';

class MovieAppBar extends StatefulWidget {
  @override
  _MovieAppBarState createState() => _MovieAppBarState();
}

class _MovieAppBarState extends State<MovieAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: Sizes.dimen_32.w),
              child: const Logo(
                height: Sizes.dimen_12,
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/svgs/Heart Icon.svg',
            height: Sizes.dimen_8.h,
          ),
          SizedBox(
            width: Sizes.dimen_10.w,
          ),
          SvgPicture.asset(
            'assets/svgs/User Icon.svg',
            height: Sizes.dimen_8.h,
          ),
        ],
      ),
    );
  }
}
