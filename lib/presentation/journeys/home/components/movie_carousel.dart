import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/data/models/movie.dart';
import 'package:mygarment/presentation/journeys/home/components/movie_card.dart';
import '../../../themes/theme_text.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import '../../../../common/extensions/size_extensions.dart';
import 'dart:math' as math;

class MovieCarousel extends StatefulWidget {
  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      // so that we can have small portion shown on left and right side
      viewportFraction: 0.8,
      // by default our movie poster
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_2.h),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          itemCount: movies.length,
          itemBuilder: (context, index) => buildMovieCardSlider(index),
        ),
      ),
    );
  }

  Widget buildMovieCardSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = index - _pageController.page;
            // We use 0.038 because 180*0.038 = 7 almost and we need to rotate our poster 7 degree
            // we use clamp so that our value vary from -1 to 1
            value = (value * 0.038).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
              child: MovieCard(movie: movies[index]),
            ),
          );
        },
      );
}
