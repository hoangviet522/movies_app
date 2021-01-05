import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import '../../common/extensions/size_extensions.dart';
import '../../presentation/themes/theme_text.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;
  final Color textColor;

  const DefaultButtonWidget(
      {Key key,
      @required this.title,
      @required this.onPressed,
      @required this.color,
      @required this.textColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: Sizes.dimen_20.h,
        width: Sizes.dimen_300.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: textColor,
                ),
          ),
        ),
      ),
    );
  }
}
