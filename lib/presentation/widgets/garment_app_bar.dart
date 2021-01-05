import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/common/extensions/size_extensions.dart';
import 'package:mygarment/presentation/widgets/text_logo.dart';

class GarmentAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_2.h,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(
        children: <Widget>[
          // GestureDetector(
          //   onTap: () {
          //     Scaffold.of(context).openDrawer();
          //   },
          //   child: Align(
          //     alignment: Alignment.topLeft,
          //     child: SvgPicture.asset(
          //       'assets/svgs/menu.svg',
          //       height: Sizes.dimen_12.h,
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
          Expanded(
            child: Center(child: TextLogo()),
          )
        ],
      ),
    );
  }
}
