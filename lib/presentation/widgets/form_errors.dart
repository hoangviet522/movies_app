import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import '../../common/extensions/size_extensions.dart';
import '../../common/extensions/string_extensions.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(errors[index], context)),
    );
  }

  Row formErrorText(String error, BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/svgs/Error.svg",
          height: Sizes.dimen_6.h,
          width: Sizes.dimen_6.w,
        ),
        SizedBox(
          width: Sizes.dimen_10.w,
        ),
        Text(error.t(context)),
      ],
    );
  }
}
