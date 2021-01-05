import 'package:flutter/material.dart';

import '../../common/extensions/size_extensions.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({Key key, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/rsz_2logo.png',
      height: height.h,
    );
  }
}
