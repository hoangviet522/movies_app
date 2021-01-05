import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/constants/size_constants.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../common/extensions/string_extensions.dart';

import '../../../themes/theme_text.dart';

class BottomBarItemWidget extends StatelessWidget {
  final Function onPress;
  final bool active;
  final String title;
  final String icon;

  const BottomBarItemWidget(
      {Key key,
      @required this.onPress,
      @required this.active,
      @required this.title,
      @required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            icon,
            width: Sizes.dimen_20.sp,
            color: active ? Colors.lightBlue : Colors.grey,
          ),
          SizedBox(height: Sizes.dimen_6.w),
          Text(
            title.t(context),
            style: active
                ? Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.lightBlue)
                : Theme.of(context).textTheme.bodyText2,
          )
        ],
      ),
    );
  }
}
