import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

class ListGenreMovie extends StatefulWidget {
  @override
  _ListGenreMovieState createState() => _ListGenreMovieState();
}

class _ListGenreMovieState extends State<ListGenreMovie> {
  List<String> genres = [
    "Action",
    "Crime",
    "Comedy",
    "Drama",
    "Horror",
    "Animation"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_6.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) => buildGenre(index, context),
      ),
    );
  }

  buildGenre(int index, BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border(
      //     right: BorderSide(
      //       color: AppColor.royalBlue,
      //     ),
      //   ),
      // ),
      child: Text(
        genres[index] + "  |  ",
        style: TextStyle(
          color: AppColor.royalBlue.withOpacity(0.7),
        ),
      ),
    );
    // return Container(
    //   alignment: Alignment.center,
    //   margin: EdgeInsets.only(left: 0),
    //   padding: EdgeInsets.symmetric(
    //     horizontal: 0,
    //     vertical: 0 / 4, // 5 padding top and bottom
    //   ),
    //   decoration: BoxDecoration(
    //     border: Border.all(color: Colors.black26),
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    //   child: Text(
    //     genres[index],
    //     style: TextStyle(
    //       color: AppColor.royalBlue.withOpacity(0.7),
    //     ),
    //   ),
    // );
  }
}
