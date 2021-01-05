import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/common/extensions/size_extensions.dart';
import 'package:mygarment/presentation/themes/theme_text.dart';
import '../../../common/extensions/string_extensions.dart';

class NavigationUserInfoItemWidget extends StatelessWidget {
  final String username;
  final String fullname;
  final bool isVIPUser;

  const NavigationUserInfoItemWidget(
      {Key key,
      @required this.username,
      @required this.fullname,
      @required this.isVIPUser})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: Sizes.dimen_48.w,
            ),
            SizedBox(width: Sizes.padding_horizontal.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  fullname,
                  style: Theme.of(context)
                      .textTheme
                      .boldSubtitle1
                      .copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: Sizes.dimen_1.h,
                ),
                Text(
                  username,
                  style: Theme.of(context)
                      .textTheme
                      .boldSubtitle2
                      .copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: Sizes.dimen_1.h,
                ),
                Text(
                  isVIPUser == true ? 'VIP User' : 'Free User',
                  style: Theme.of(context)
                      .textTheme
                      .boldSubtitle2
                      .copyWith(color: Colors.white),
                ),
              ],
            )
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(
              top: Sizes.dimen_4.h,
            ),
            padding: EdgeInsets.symmetric(
              vertical: Sizes.dimen_4.h,
              horizontal: Sizes.dimen_22.w,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              TranslationConstants.buyVip.t(context),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        )
      ],
    );
  }
}
