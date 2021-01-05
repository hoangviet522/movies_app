import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import '../../common/extensions/string_extensions.dart';
import '../../common/extensions/size_extensions.dart';
import '../themes/theme_text.dart';

class LanguageTileWidget extends StatelessWidget {
  final String language;

  const LanguageTileWidget({Key key, @required this.language})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          language == 'vietnamese' ? '🇻🇳' : '🇬🇧',
          style: TextStyle(fontSize: Sizes.dimen_40.sp),
        ),
        SizedBox(width: Sizes.dimen_8.w),
        Text(
          language == 'vietnamese'
              ? TranslationConstants.vietnamese.t(context)
              : TranslationConstants.english.t(context),
          style: Theme.of(context).textTheme.whiteSubtitle1.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
