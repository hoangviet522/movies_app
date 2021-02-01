import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/data/core/api_constants.dart';
import 'package:mygarment/data/models/movie.dart';
import 'package:mygarment/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

import '../../../themes/theme_text.dart';
import '../../../../common/extensions/size_extensions.dart';

class MovieBackdropWidget extends StatelessWidget {
  Movie movie;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(Sizes.dimen_40.w),
        ),
        child: Stack(
          children: [
            FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child: BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
                builder: (context, state) {
                  if (state is MovieBackdropChanged) {
                    return CachedNetworkImage(
                      imageUrl:
                          '${ApiConstants.BASE_IMAGE_URL}${state.movie.backdropPath}',
                      fit: BoxFit.fitHeight,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              // child: CachedNetworkImage(
              //   imageUrl:
              //       'https://i.pinimg.com/474x/c8/34/60/c83460dc27f87e9c11805b1d5dcb8e10.jpg',
              //   fit: BoxFit.fill,
              // ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                width: ScreenUtil.screenWidth,
                height: 1,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
