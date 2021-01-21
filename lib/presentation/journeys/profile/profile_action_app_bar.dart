import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import '../../../common/extensions/size_extensions.dart';

class ProfileActionAppBar extends StatelessWidget {
  const ProfileActionAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            'assets/svgs/writing.svg',
            height: Sizes.dimen_8.h,
            color: Colors.white.withOpacity(0.5),
          ),
          SizedBox(
            width: Sizes.dimen_16.w,
          ),
          SvgPicture.asset(
            'assets/svgs/more.svg',
            height: Sizes.dimen_8.h,
            color: Colors.white.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
