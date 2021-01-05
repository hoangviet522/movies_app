import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../common/extensions/string_extensions.dart';

import '../../themes/theme_text.dart';

class NextButtonWidget extends StatelessWidget {
  final Function onPressed;

  const NextButtonWidget({Key key, @required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.only(right: Sizes.dimen_20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                TranslationConstants.next.t(context),
                style: Theme.of(context).textTheme.boldSubtitle1,
              ),
              SizedBox(
                width: Sizes.dimen_6.w,
              ),
              Icon(Icons.arrow_forward)
            ],
          ),
        ),
      ),
    );
  }
}
