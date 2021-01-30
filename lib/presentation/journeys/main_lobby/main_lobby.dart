import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygarment/di/get_it.dart';
import 'package:mygarment/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:mygarment/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:mygarment/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:mygarment/presentation/journeys/main_lobby/movie_carousel/movie_carousel.dart';
import 'package:mygarment/presentation/journeys/main_lobby/movie_tabbed/movie_tabbed_widget.dart';
import 'package:mygarment/presentation/journeys/side_bar_menu/navigation_sidebar.dart';

class MainLobby extends StatefulWidget {
  @override
  _MainLobbyState createState() => _MainLobbyState();
}

class _MainLobbyState extends State<MainLobby> {
  MovieCarouselBloc movieCarouselBloc;
  MovieBackdropBloc movieBackdropBloc;
  MovieTabbedBloc movieTabbedBloc;

  @override
  void initState() {
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    movieTabbedBloc = getItInstance<MovieTabbedBloc>();
    super.initState();
  }

  @override
  void dispose() {
    movieCarouselBloc?.close();
    movieBackdropBloc?.close();
    movieTabbedBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieCarouselBloc,
        ),
        BlocProvider(
          create: (context) => movieBackdropBloc,
        ),
        BlocProvider(
          create: (context) => movieTabbedBloc,
        ),

        // create: (context) => movieCarouselBloc,
      ],
      child: Scaffold(
          drawer: const NavigationSidebar(),
          body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
            builder: (context, state) {
              if (state is MovieCarouselLoaded) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF131221),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      FractionallySizedBox(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.6,
                        child: MovieCarouselWidget(
                          movies: state.movies,
                          defaultIndex: state.defaultIndex,
                        ),
                      ),
                      FractionallySizedBox(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 0.4,
                        child: MovieTabbedWidget(),
                      ),
                    ],
                  ),
                );
              }
              return SizedBox.shrink();
            },
          )),
    );
  }
}
