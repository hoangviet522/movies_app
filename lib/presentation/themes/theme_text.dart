import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import '../../common/constants/size_constants.dart';
import '../../common/extensions/size_extensions.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get _headline6 =>
      _poppinTextTheme.headline6.copyWith(fontSize: Sizes.dimen_20.sp);

  static TextStyle get _headline5 =>
      _poppinTextTheme.headline5.copyWith(fontSize: Sizes.dimen_24.sp);

  static TextStyle get _headline4 =>
      _poppinTextTheme.headline4.copyWith(fontSize: Sizes.dimen_32.sp);

  static TextStyle get _headline2 =>
      _poppinTextTheme.headline2.copyWith(fontSize: Sizes.dimen_48.sp);

  static TextStyle get subtitle1 =>
      _poppinTextTheme.subtitle1.copyWith(fontSize: Sizes.dimen_16.sp);

  static TextStyle get subtitle2 =>
      _poppinTextTheme.subtitle2.copyWith(fontSize: Sizes.dimen_12.sp);

  static getTextTheme() => TextTheme(
        headline6: _headline6,
        subtitle1: subtitle1,
        headline5: _headline5,
        headline4: _headline4,
        headline2: _headline2,
        subtitle2: subtitle2,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get boldSubtitle1 => subtitle1.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle get boldSubtitle2 => subtitle2.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle get whiteBoldSubtitle2 => subtitle2.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );

  TextStyle get whiteBoldSubtitle1 => subtitle1.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );
  TextStyle get whiteSubtitle1 => subtitle1.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      );

  TextStyle get whiteOpacitySubtitle2 => subtitle2.copyWith(
        color: Colors.white.withOpacity(0.6),
        // fontWeight: FontWeight.w600,
      );

  TextStyle get whiteHeadline4 => headline4.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );

  TextStyle get lightBlueHeadline6 => headline6.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );

  TextStyle get blackHeadline2 => headline2.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      );

  TextStyle get whiteHeadline6 => headline6.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  TextStyle get whiteHeadline2 => headline2.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  // TextStyle get whiteSubtitle1 => subtitle1.copyWith(
  //       color: Colors.white,
  //     );

  TextStyle get whiteOpacitySubtitle1 => subtitle1.copyWith(
        color: Colors.white.withOpacity(0.7),
      );

  TextStyle get whiteBoldHeadline5 => headline5.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      );

  TextStyle get blackBoldHeadline6 => headline6.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      );

  TextStyle get royalBlueSubtitle1 => subtitle1.copyWith(
        color: AppColor.royalBlue,
        fontWeight: FontWeight.w600,
      );

  TextStyle get royalBlueSubtitle2 => subtitle2.copyWith(
        color: AppColor.royalBlue,
        fontWeight: FontWeight.w600,
      );

  TextStyle get violetSubtitle2 => subtitle2.copyWith(
        color: AppColor.violet,
        fontWeight: FontWeight.w600,
      );
}
