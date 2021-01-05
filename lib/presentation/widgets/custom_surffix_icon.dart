import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import '../../common/extensions/size_extensions.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key key,
    @required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        Sizes.dimen_4.h,
        Sizes.dimen_4.w,
        Sizes.dimen_4.h,
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: Sizes.dimen_1.h,
      ),
    );
  }
}
