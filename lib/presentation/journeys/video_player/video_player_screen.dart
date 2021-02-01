import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/data/models/movie.dart';
import 'package:mygarment/di/get_it.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';
import 'package:mygarment/presentation/blocs/video_movie/video_movie_bloc.dart';
import 'package:mygarment/presentation/journeys/side_bar_menu/navigation_sidebar.dart';
import 'package:mygarment/presentation/journeys/video_player/navigator_list_film.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import 'package:mygarment/presentation/widgets/movie_app_bar.dart';
import '../../../common/extensions/size_extensions.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import '../../themes/theme_text.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final MovieEntity movie;
  // final VideoEntity video;
  final VideoMovieBloc videoMovieBloc;

  const VideoPlayerScreen(
      {Key key, @required this.movie, @required this.videoMovieBloc})
      : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoMovieBloc videoMovieBloc;
  YoutubePlayerController _controller;
  // Movie movie;

  @override
  void initState() {
    runYoutubePlayer();
    videoMovieBloc = getItInstance<VideoMovieBloc>();
    videoMovieBloc.add(VideoMovieLoadEvent(widget.movie.id));
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    videoMovieBloc?.close();
    super.dispose();
  }

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId("ozUuAcGOhPs"),
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print("movieId ${widget.movie.id}");
    return BlocProvider<VideoMovieBloc>(
      create: (context) => videoMovieBloc,
      child: BlocBuilder<VideoMovieBloc, VideoMovieState>(
        builder: (context, state) {
          // if (state is VideoMovieLoading) {
          //   return Center(
          //     child: Text("Loading..."),
          //   );
          // } else
          // if (state is VideoMovieLoaded) {
          return YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
              progressIndicatorColor: AppColor.violet,
              showVideoProgressIndicator: true,
            ),
            builder: (context, player) {
              return Scaffold(
                body: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.1,
                          0.6,
                          0.9,
                          1
                        ],
                        colors: [
                          Color(0xFF1b0924).withOpacity(0.8),
                          Color(0xFF290d36),
                          Color(0xFF0B0623),
                          Color(0xFF07031C),
                        ]),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: ScreenUtil.screenHeight * 0.25,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: player,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: Sizes.dimen_24.w,
                                  top: Sizes.dimen_16.h,
                                ),
                                child: SvgPicture.asset(
                                  'assets/svgs/cancel.svg',
                                  height: Sizes.dimen_8.h,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: Sizes.dimen_20.h,
                            left: Sizes.dimen_14.w,
                            right: Sizes.dimen_14.w,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.movie.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .whiteBoldHeadline5
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  SvgPicture.asset(
                                    'assets/svgs/Log out.svg',
                                    height: Sizes.dimen_8.h,
                                    color: AppColor.royalBlue,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Sizes.dimen_1.h,
                              ),
                              Text(
                                widget.movie.releaseDate,
                                style: Theme.of(context)
                                    .textTheme
                                    .whiteOpacitySubtitle2,
                              ),
                              SizedBox(
                                height: Sizes.dimen_8.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Action  |  Crime  |  Drama  |  Mystery",
                                    // widget.movie.genres['name'];
                                    style: TextStyle(color: AppColor.violet),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svgs/share.svg',
                                        height: Sizes.dimen_8.h,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                      SizedBox(
                                        width: Sizes.dimen_10.w,
                                      ),
                                      SvgPicture.asset(
                                        'assets/svgs/like.svg',
                                        height: Sizes.dimen_8.h,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                      SizedBox(
                                        width: Sizes.dimen_10.w,
                                      ),
                                      SvgPicture.asset(
                                        'assets/svgs/add.svg',
                                        height: Sizes.dimen_8.h,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Sizes.dimen_8.h,
                              ),
                              Divider(
                                color: Colors.white.withOpacity(0.5),
                                thickness: 2,
                              ),
                              Expanded(
                                child: NavigatorListFilm(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
          // }
          // return SizedBox.shrink();
        },
      ),
    );
  }
}
