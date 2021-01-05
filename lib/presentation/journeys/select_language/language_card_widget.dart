import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mygarment/common/constants/languages.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/domain/entities/language_entity.dart';
import 'package:mygarment/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:mygarment/presentation/journeys/welcome/welcome_screen.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../common/extensions/string_extensions.dart';

import '../../themes/theme_text.dart';

class LanguageCardWidget extends StatelessWidget {
  final LanguageEntity language;

  const LanguageCardWidget({Key key, this.language}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<LanguageBloc>(context).add(
          ToggleLanguageEvent(language),
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => WelcomeScreen(),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: Sizes.dimen_10.h),
        child: Row(
          children: [
            Container(
              width: Sizes.dimen_80.w,
              height: Sizes.dimen_20.h,
              decoration: BoxDecoration(
                border: Border.all(width: Sizes.dimen_0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  language.imagePath,
                  height: Sizes.dimen_6.h,
                  width: Sizes.dimen_6.w,
                ),
              ),
            ),
            SizedBox(width: Sizes.dimen_20.w),
            Text(
              language.value,
              style: Theme.of(context).textTheme.lightBlueHeadline6,
            ),
          ],
        ),
      ),
    );
  }
}
