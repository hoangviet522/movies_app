import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/data/models/movie.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

class GridViewMovie extends StatefulWidget {
  @override
  _GridViewMovieState createState() => _GridViewMovieState();
}

class _GridViewMovieState extends State<GridViewMovie> {
  Movie movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(),
      // color: Colors.amberAccent,
      height: ScreenUtil.screenHeight * 0.5,
      child: GridView.builder(
        itemCount: movies.length,
        //   crossAxisSpacing: 20,
        //   mainAxisSpacing: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 14,
          mainAxisSpacing: 20,
          childAspectRatio: Sizes.dimen_36 / Sizes.dimen_72,
        ),
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              height: Sizes.dimen_60.h,
              // width: Sizes.dimen_100.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(movies[index].poster),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: Sizes.dimen_2.h,
            ),
            Text(
              movies[index].title,
              style: Theme.of(context).textTheme.whiteOpacitySubtitle2,
            ),
          ],
        ),
      ),
      // ),
      //  GridView.count(
      //   crossAxisSpacing: 20,
      //   mainAxisSpacing: 20,
      //   crossAxisCount: 3,
      //   childAspectRatio: Sizes.dimen_40 / Sizes.dimen_72,
      //   children: List.generate(
      //     6,
      //     (index) =>

      // ),
    );
  }
}
