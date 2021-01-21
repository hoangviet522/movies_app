import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mygarment/common/constants/languages.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/common/extensions/size_extensions.dart';
import 'package:mygarment/common/extensions/string_extensions.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/presentation/journeys/profile/grid_view_movie.dart';
import 'package:mygarment/presentation/journeys/profile/list_category.dart';
import 'package:mygarment/presentation/journeys/profile/list_genre_movie.dart';
import 'package:mygarment/presentation/journeys/profile/profile_action_app_bar.dart';
import 'package:mygarment/presentation/journeys/profile/profile_info.dart';

import 'package:mygarment/presentation/themes/theme_color.dart';
import 'package:mygarment/presentation/themes/theme_text.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF131221),
        child: Column(
          children: <Widget>[
            ProfileActionAppBar(),
            SizedBox(
              height: Sizes.dimen_12.h,
            ),
            ProfileInfo(),
            SizedBox(
              height: Sizes.dimen_20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_20.w),
              child: Column(
                children: [
                  ListAction(),
                  ListGenreMovie(),
                  GridViewMovie(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
