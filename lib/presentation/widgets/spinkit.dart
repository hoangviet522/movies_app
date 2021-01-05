import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/extensions/size_extensions.dart';

class LoadingSpinkit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: Theme.of(context).primaryColor,
      size: Sizes.dimen_18.w,
    );
  }
}
