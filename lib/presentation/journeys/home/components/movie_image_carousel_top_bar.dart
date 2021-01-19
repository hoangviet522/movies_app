import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/data/models/movie.dart';
import '../../../../common/extensions/size_extensions.dart';

class MovieImageTopBarCarousel extends StatefulWidget {
  @override
  _MovieImageTopBarCarouselState createState() =>
      _MovieImageTopBarCarouselState();
}

class _MovieImageTopBarCarouselState extends State<MovieImageTopBarCarousel> {
  PageController _pageController;
  int initialPage = 1;
  Movie movie;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 0.9 / 0.4,
          child: PageView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(movies[index].poster),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Sizes.dimen_36,
            right: Sizes.dimen_36,
            top: Sizes.dimen_55,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                FontAwesomeIcons.userCircle,
                color: Colors.white,
              ),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.ticketAlt,
                    color: Colors.white,
                  ),
                  SizedBox(width: Sizes.dimen_20),
                  Icon(
                    FontAwesomeIcons.bars,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
