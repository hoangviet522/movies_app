import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';

import '../../common/extensions/size_extensions.dart';
import '../themes/theme_text.dart';

class NoListItemWidget extends StatelessWidget {
  final String title;
  final String desc;

  const NoListItemWidget({Key key, @required this.title, this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_48.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 1,
            ),
            Image.asset('assets/pngs/learning.jpg'),
            SizedBox(
              height: Sizes.dimen_16.h,
            ),
            Text(title, style: Theme.of(context).textTheme.boldSubtitle1),
            SizedBox(
              height: Sizes.padding_vertical.h,
            ),
            Text(
              desc == null ? '' : desc,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
