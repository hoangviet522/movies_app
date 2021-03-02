import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/data/models/movie.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';
import 'package:mygarment/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
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
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Movie movie;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        if (state is MovieTabbedLoadding)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (state is MovieTabChanged) {
          return Padding(
            padding: EdgeInsets.only(top: Sizes.dimen_1.h),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var i = 0;
                        i < MovieTabbedConstant.movieTabs.length;
                        i++)
                      TabTileWidget(
                        title: MovieTabbedConstant.movieTabs[i].title
                            .toUpperCase(),
                        onTap: () => onTabTabbed(i),
                        // onTap: () {},
                        isSelected: MovieTabbedConstant.movieTabs[i].index ==
                            state.currentTabIndex,
                      ),
                  ],
                ),
                // if (state is MovieTabChanged)
                // Expanded(
                //   child: MovieListViewBuilder(movies: state.movies),
                // ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Sizes.dimen_4.h,
                        horizontal: Sizes.dimen_16.w),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.movies.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 14.w);
                      },
                      itemBuilder: (context, index) {
                        final MovieEntity movie = state.movies[index];
                        return MovieTabCardWidget(
                          index: index,
                          title: movie.title,
                          posterPath: movie.posterPath,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  void onTabTabbed(int index) {
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
