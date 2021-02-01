import 'package:flutter/material.dart';
import 'package:mygarment/data/models/movie.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';
import 'package:mygarment/presentation/journeys/home/components/movie_carousel.dart';
import 'package:mygarment/presentation/journeys/main_lobby/movie_carousel/movie_backdrop.dart';
import 'package:mygarment/presentation/journeys/main_lobby/movie_carousel/movie_data_widget.dart';
import 'package:mygarment/presentation/journeys/main_lobby/movie_carousel/movie_page_view.dart';
import 'package:mygarment/presentation/widgets/movie_app_bar.dart';

class MovieCarouselWidget extends StatefulWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({Key key, this.movies, this.defaultIndex})
      : super(key: key);
  @override
  _MovieCarouselWidgetState createState() => _MovieCarouselWidgetState();
}

class _MovieCarouselWidgetState extends State<MovieCarouselWidget> {
  // Movie movie;

  @override
  Widget build(BuildContext context) {
    // print(widget.movies);
    return Stack(
      // fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            // MovieCarousel(),
            MoviePageView(
              movies: widget.movies,
              initialPage: widget.defaultIndex,
            ),
            MovieDataWidget(),
          ],
        ),
      ],
    );
  }
}
