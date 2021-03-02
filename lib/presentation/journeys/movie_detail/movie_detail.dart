import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/data/core/api_constants.dart';
import 'package:mygarment/di/get_it.dart';
import 'package:mygarment/domain/entities/movie_entity.dart';
import 'package:mygarment/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:mygarment/presentation/blocs/video_movie/video_movie_bloc.dart';
import 'package:mygarment/presentation/journeys/movie_detail/movie_detail_app_bar.dart';
import 'package:mygarment/presentation/journeys/movie_detail/movie_detail_content.dart';
import 'package:mygarment/presentation/journeys/side_bar_menu/navigation_sidebar.dart';
import 'package:mygarment/presentation/journeys/video_player/video_player_screen.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import 'package:mygarment/presentation/widgets/common_button.dart';
import 'package:mygarment/presentation/widgets/movie_app_bar.dart';
import '../../../common/extensions/size_extensions.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import '../../themes/theme_text.dart';

class MovieDetail extends StatefulWidget {
  final int id;

  const MovieDetail({Key key, @required this.id}) : super(key: key);
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  MovieDetailBloc movieDetailBloc;
  VideoMovieBloc videoMovieBloc;

  @override
  void initState() {
    movieDetailBloc = getItInstance<MovieDetailBloc>();
    movieDetailBloc.add(MovieDetailLoadEvent(widget.id));
    videoMovieBloc = getItInstance<VideoMovieBloc>();
    videoMovieBloc.add(VideoMovieLoadEvent(widget.id));
    super.initState();
  }

  @override
  void dispose() {
    movieDetailBloc?.close();
    videoMovieBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.movie.id);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieDetailBloc,
        ),
        BlocProvider(
          create: (context) => videoMovieBloc,
        ),
      ],
      child: BlocProvider<MovieDetailBloc>(
        create: (context) => movieDetailBloc,
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieDetailLoaded) {
              return Scaffold(
                  floatingActionButton: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
                    child: CommonButton(
                      text: "Watch It",
                      colorStart: AppColor.royalBlue,
                      colorEnd: AppColor.violet,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                VideoPlayerScreen(
                              movie: state.movie,
                              // video:
                              videoMovieBloc: videoMovieBloc,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  drawer: const NavigationSidebar(),
                  body: Container(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          height: ScreenUtil.defaultHeight * 0.65,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    "${ApiConstants.BASE_IMAGE_URL}${state.movie.posterPath}"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: Sizes.dimen_24.h,
                            left: Sizes.dimen_32.w,
                            right: Sizes.dimen_32.w,
                            bottom: Sizes.dimen_32.h,
                          ),
                          // height: ScreenUtil.screenHeight,
                          height: ScreenUtil.screenHeight,
                          width: double.infinity,
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
                                  Color(0xFFF97474).withOpacity(0.1),
                                  Color(0xFF5E2D3F),
                                  Color(0xFF0B0623),
                                  Color(0xFF07031C),
                                ]),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MovieDetailAppBar(),
                              SizedBox(
                                height: Sizes.dimen_150.h,
                              ),
                              Expanded(
                                child: MovieDetailContent(
                                  movie: state.movie,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  // BlocBuilder<MovieDetailBloc, MovieDetailState>(
                  //   builder: (context, state) {
                  //     if (state is MovieDetailLoading) {
                  //       return Text("Loading....");
                  //     } else if (state is MovieDetailLoaded) {

                  //     }
                  //     return SizedBox.shrink();
                  //   },
                  // ),
                  );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
