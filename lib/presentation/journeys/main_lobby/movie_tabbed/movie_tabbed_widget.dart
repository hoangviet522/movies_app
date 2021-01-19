import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/data/models/movie.dart';
import 'package:mygarment/presentation/journeys/main_lobby/movie_tabbed/movie_list_view_builder.dart';
import 'package:mygarment/presentation/journeys/main_lobby/movie_tabbed/movie_tab_card_widget.dart';
import 'package:mygarment/presentation/journeys/main_lobby/movie_tabbed/movie_tabbed_constant.dart';
import 'package:mygarment/presentation/journeys/main_lobby/movie_tabbed/tab_tile_widget.dart';

import '../../../themes/theme_text.dart';
import '../../../../common/extensions/size_extensions.dart';

class MovieTabbedWidget extends StatefulWidget {
  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget> {
  int currentIndex = 0;

  // Movie movie;
  // List<Movie> movies;
  Movie movie;
  @override
  Widget build(BuildContext context) {
    // print(movies.length);
    return Padding(
      padding: EdgeInsets.only(top: Sizes.dimen_1.h),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i = 0; i < MovieTabbedConstant.movieTabs.length; i++)
                TabTileWidget(
                  title: MovieTabbedConstant.movieTabs[i].title.toUpperCase(),
                  onTap: () => onTabTabbed(i),
                  // onTap: () {},
                  isSelected:
                      MovieTabbedConstant.movieTabs[i].index == currentIndex,
                ),
            ],
          ),
          Expanded(
            // child: MovieListViewBuilder(movie: movies),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Sizes.dimen_4.h, horizontal: Sizes.dimen_16.w),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: movies.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 14.w);
                },
                itemBuilder: (context, index) {
                  return MovieTabCardWidget(movie: movies[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTabTabbed(int index) {
    setState(() {
      currentIndex = index;
    });
    // movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
