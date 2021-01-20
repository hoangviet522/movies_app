import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import '../../common/extensions/size_extensions.dart';
import '../themes/theme_text.dart';

class CommonButton extends StatelessWidget {
  final double height;
  final Color colorStart, colorEnd;
  final String text;
  final Function onPressed;

  const CommonButton(
      {Key key,
      this.height,
      this.colorStart,
      this.colorEnd,
      this.text,
      this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidth,
      height: height,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_20.w),
        gradient: new LinearGradient(
          // colors: [Colors.blueGrey, Colors.grey],
          // colors: [AppColor.royalBlue, AppColor.violet],
          colors: [colorStart, colorEnd],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        ),
      ),
      child: FlatButton(
        child: new Text(
          // 'Watch It',
          text,
          style: Theme.of(context).textTheme.whiteBoldSubtitle1,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
