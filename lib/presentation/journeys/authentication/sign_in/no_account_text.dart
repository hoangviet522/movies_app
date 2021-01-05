import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/translation_constant.dart';

import '../../../../common/extensions/string_extensions.dart';

import '../../../themes/theme_text.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          TranslationConstants.dontHaveAccount.t(context),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        GestureDetector(
          // onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          onTap: () {},
          child: Text(
            "  ${TranslationConstants.signup.t(context)}",
            style: Theme.of(context).textTheme.lightBlueBoldSubtitle1,
          ),
        ),
      ],
    );
  }
}
