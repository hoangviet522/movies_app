import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';

class NavigationDivider extends StatelessWidget {
  const NavigationDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Sizes.dimen_14,
        right: Sizes.dimen_14,
      ),
      child: Divider(
        height: Sizes.dimen_1,
      ),
    );
  }
}
