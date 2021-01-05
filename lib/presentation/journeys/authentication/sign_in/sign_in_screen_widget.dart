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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_40.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: ScreenUtil.screenHeight * 0.03),
              Text(
                TranslationConstants.welcomeBack.t(context),
                style: Theme.of(context).textTheme.blackHeadline2,
              ),
              Text(
                "${TranslationConstants.signInDesc1.t(context)}\n${TranslationConstants.signInDesc2.t(context)}",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ScreenUtil.screenHeight * 0.05),
              SignForm(),
              SizedBox(height: ScreenUtil.screenHeight * 0.06),
              SocalCardWidget(
                  icon: "assets/svgs/google-icon.svg",
                  press: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false);
                  },
                  text: TranslationConstants.signInWithGoogle.t(context)),
              SizedBox(
                height: Sizes.dimen_4.h,
              ),
              SocalCardWidget(
                icon: "assets/svgs/facebook-2.svg",
                press: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (Route<dynamic> route) => false);
                },
                text: TranslationConstants.signInWithFacebook.t(context),
              ),
              SizedBox(height: Sizes.dimen_20.h),
              NoAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
