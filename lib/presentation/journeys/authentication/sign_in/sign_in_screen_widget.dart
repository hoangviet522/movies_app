import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/presentation/journeys/authentication/sign_in/no_account_text.dart';
import 'package:mygarment/presentation/journeys/authentication/sign_in/sign_in_form.dart';
import 'package:mygarment/presentation/journeys/home/home_screen.dart';
import 'package:mygarment/presentation/widgets/social_card_widget.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../common/extensions/string_extensions.dart';

import '../../../themes/theme_text.dart';

class SignInScreenWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: ScreenUtil.screenHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/jpgs/signin_bg.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: ScreenUtil.screenHeight,
            width: double.infinity,
            color: Colors.black.withOpacity(0.5),
            child: Column(
              children: [
                SizedBox(height: Sizes.dimen_48.h),
                Text(
                  "Movie",
                  style: Theme.of(context).textTheme.whiteHeadline2,
                ),
                Text(
                  "place of intertament",
                  style: Theme.of(context).textTheme.whiteOpacitySubtitle1,
                ),
                SizedBox(height: Sizes.dimen_55.h),
                Text(
                  "Sign In To Movie",
                  style: Theme.of(context).textTheme.whiteBoldHeadline5,
                ),
                SignForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
