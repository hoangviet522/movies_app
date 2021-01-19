import 'package:flutter/material.dart';
import 'package:mygarment/data/models/movie.dart';
import 'package:mygarment/presentation/journeys/video_player/list_film_card.dart';
import '../../../common/extensions/size_extensions.dart';

class NavigatorListFilm extends StatelessWidget {
  int currentIndex = 0;
  Movie movie;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: movies.length,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 6.h,
        );
      },
      itemBuilder: (context, index) {
        return ListFilmCard(movie: movies[index]);
      },
    );
  }
}
