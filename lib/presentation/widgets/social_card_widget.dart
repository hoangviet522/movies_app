import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import '../../common/extensions/size_extensions.dart';
import '../themes/theme_text.dart';
import '../../common/extensions/string_extensions.dart';

class SocalCardWidget extends StatelessWidget {
  const SocalCardWidget({
    Key key,
    @required this.icon,
    @required this.press,
    @required this.text,
  }) : super(key: key);

  final String icon;
  final Function press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: Sizes.dimen_10.w),
            padding: EdgeInsets.all(Sizes.dimen_12.w),
            height: Sizes.dimen_40,
            width: Sizes.dimen_40,
            decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(icon),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.lightBlueSubtitle1,
          ),
        ],
      ),
    );
  }
}
