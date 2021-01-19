import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/data/models/movie.dart';
import '../../../themes/theme_text.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import '../../../../common/extensions/size_extensions.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_20.w),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 3,
                      // offset: Offset(0, 3),
                    )
                  ],
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(movie.poster),
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_1.h),
            child: Text(
              movie.title,
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "( " + movie.movieLength,
              ),
              SizedBox(
                width: Sizes.dimen_10.w,
              ),
              Text(
                movie.releaseDate + " )",
              ),
            ],
          ),
          SizedBox(
            height: Sizes.dimen_1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svgs/star.svg",
                height: 16,
              ),
              SizedBox(width: Sizes.dimen_6.w),
              Text(
                "${movie.rating}",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
