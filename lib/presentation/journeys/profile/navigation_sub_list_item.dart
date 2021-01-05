import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../common/extensions/string_extensions.dart';

class NavigationSubListItem extends StatelessWidget {
  final String title;
  final Function onPressed;
  final String icon;

  const NavigationSubListItem(
      {Key key,
      @required this.title,
      @required this.onPressed,
      @required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.transparent,
              blurRadius: 2,
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 50.w),
          title: Row(
            children: [
              Image.asset(
                icon,
                // height: 25,
                width: 20,
              ),
              SizedBox(
                width: Sizes.dimen_20,
              ),
              Text(
                title.toLowerCase().t(context),
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
