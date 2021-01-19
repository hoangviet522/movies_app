import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/data/models/movie.dart';

import '../../../themes/theme_text.dart';
import '../../../../common/extensions/size_extensions.dart';

class MovieDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Dark ( 1hr 44mins )",
          textAlign: TextAlign.center,
          maxLines: 1,
          style: Theme.of(context).textTheme.whiteOpacitySubtitle2,
        ),
        // Text("30 Dec, 2020"),
      ],
    );
  }
}
