import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';
import 'package:mygarment/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

import 'package:mygarment/presentation/journeys/main_lobby/movie_carousel/movie_card.dart';

import '../../../../common/extensions/size_extensions.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageView({Key key, this.movies, this.initialPage})
      : super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Sizes.dimen_10.h,
      ),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        controller: _pageController,
        // itemCount: movies.length,
        itemCount: widget.movies?.length ?? 0,
        pageSnapping: true,
        itemBuilder: (context, index) => buildMovieCardSlider(index),
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropBloc>(context).add(
            MovieBackdropChangedEvent(widget.movies[index]),
          );
        },
      ),
    );
  }

  Widget buildMovieCardSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 1;
          if (_pageController.position.haveDimensions) {
            value = _pageController.page - index;
            value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
            return Padding(
              padding: EdgeInsets.only(top: 0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: Curves.easeIn.transform(value) *
                      ScreenUtil.screenHeight *
                      0.35,
                  width: Sizes.dimen_230.w,
                  child: child,
                ),
              ),
            );
          } else {
            return Align(
              alignment: Alignment.topCenter,
              child: Container(
                height:
                    Curves.easeIn.transform(index == 0 ? value : value * 0.2) *
                        ScreenUtil.screenHeight *
                        0.35,
                width: Sizes.dimen_230.w,
                child: child,
              ),
            );
          }
        },
        child: MovieCardWidget(movie: widget.movies[index]),
      );
}
