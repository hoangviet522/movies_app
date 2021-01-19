import 'package:flutter/material.dart';
import 'package:mygarment/presentation/journeys/main_lobby/movie_carousel/movie_carousel.dart';
import 'package:mygarment/presentation/journeys/main_lobby/movie_tabbed/movie_tabbed_widget.dart';
import 'package:mygarment/presentation/journeys/side_bar_menu/navigation_sidebar.dart';

class MainLobby extends StatefulWidget {
  @override
  _MainLobbyState createState() => _MainLobbyState();
}

class _MainLobbyState extends State<MainLobby> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationSidebar(),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF131221),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.6,
              child: MovieCarouselWidget(),
            ),
            FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.4,
              child: MovieTabbedWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
