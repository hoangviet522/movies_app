import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/extensions/size_extensions.dart';

class TextLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'MyGarment',
      style: GoogleFonts.fredokaOne(
        fontWeight: FontWeight.w600,
        fontSize: Sizes.dimen_24.sp,
      ),
    );
  }
}
