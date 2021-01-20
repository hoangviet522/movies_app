import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/data/models/movie.dart';
// import '../../../common/constants/size_constants.dart';
import '../../../common/extensions/size_extensions.dart';

class ListCard extends StatelessWidget {
  final Movie movie;

  const ListCard({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(20),
    //   child: Image.asset(
    //     movie.poster,
    //     fit: BoxFit.cover,
    //   ),
    // );
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            movie.poster,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: Sizes.dimen_20.w,
            top: Sizes.dimen_6.h,
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              'assets/svgs/cancel.svg',
              height: Sizes.dimen_10.h,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
