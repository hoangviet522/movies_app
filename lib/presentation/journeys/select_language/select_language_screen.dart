import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/languages.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/presentation/journeys/select_language/language_card_widget.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

class SelectLanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_40.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: ScreenUtil.screenHeight * 0.2),
            Text(
              'Choose your \nlanguages',
              style: Theme.of(context).textTheme.blackHeadline2,
            ),
            SizedBox(height: ScreenUtil.screenHeight * 0.1),
            for (var i = 0; i < Languages.languages.length; i++)
              LanguageCardWidget(language: Languages.languages[i]),
          ],
        ),
      ),
    );
  }
}
