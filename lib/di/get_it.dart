import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mygarment/data/core/hive_service.dart';
import 'package:mygarment/data/data_sources/movie_remote_data_source.dart';
import 'package:mygarment/data/repositories/category_repository_impl.dart';
import 'package:mygarment/data/repositories/movie_repository_impl.dart';
import 'package:mygarment/domain/repositories/category_repository.dart';
import 'package:mygarment/domain/repositories/movie_repository.dart';
import 'package:mygarment/domain/usecases/get_categories.dart';
import 'package:mygarment/domain/usecases/get_coming_soon.dart';
import 'package:mygarment/domain/usecases/get_movie_detail.dart';
import 'package:mygarment/domain/usecases/get_playing_now.dart';
import 'package:mygarment/domain/usecases/get_popular.dart';
import 'package:mygarment/domain/usecases/get_similar_movie.dart';
import 'package:mygarment/domain/usecases/get_top_rated.dart';
import 'package:mygarment/domain/usecases/get_trending.dart';
import 'package:mygarment/domain/usecases/get_video_movie.dart';
import 'package:mygarment/presentation/blocs/category/category_bloc.dart';
import 'package:mygarment/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:mygarment/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:mygarment/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:mygarment/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:mygarment/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:mygarment/presentation/blocs/similar_movie/similar_movie_bloc.dart';
import 'package:mygarment/presentation/blocs/splash_screen/splash_screen_bloc.dart';
import 'package:mygarment/presentation/blocs/video_movie/video_movie_bloc.dart';
import '../data/core/api_client.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  // getItInstance.registerLazySingleton<HiveService>(() => HiveService());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));

  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));

  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));

  getItInstance.registerLazySingleton<GetCommingSoon>(
      () => GetCommingSoon(getItInstance()));

  getItInstance
      .registerLazySingleton<GetTopRated>(() => GetTopRated(getItInstance()));

  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getItInstance()));

  getItInstance.registerLazySingleton<GetVideoMovie>(
      () => GetVideoMovie(getItInstance()));

  getItInstance.registerLazySingleton<GetSimilarMovie>(
      () => GetSimilarMovie(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));

  getItInstance.registerFactory(() => MovieBackdropBloc());

  getItInstance.registerFactory(() => MovieCarouselBloc(
        getPopular: getItInstance(),
        movieBackdropBloc: getItInstance(),
      ));

  getItInstance.registerFactory(() => MovieTabbedBloc(
        getTrending: GetTrending(getItInstance()),
        getPlayingNow: GetPlayingNow(getItInstance()),
        getCommingSoon: GetCommingSoon(getItInstance()),
        getTopRated: GetTopRated(getItInstance()),
      ));

  getItInstance.registerFactory(
    () => MovieDetailBloc(
      getMovieDetail: getItInstance(),
      getVideoMovie: GetVideoMovie(getItInstance()),
    ),
  );

  getItInstance
      .registerFactory(() => VideoMovieBloc(getVideoMovie: getItInstance()));

  getItInstance.registerFactory(
      () => SimilarMovieBloc(getSimilarMovie: getItInstance()));

  // getItInstance.registerFactory(() => SplashScreenBloc());

  // getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());

  // //category di

  // getItInstance.registerLazySingleton<GetCategories>(
  //     () => GetCategories(getItInstance()));

  // getItInstance.registerLazySingleton<CategoryRemoteDataSource>(
  //     () => CategoryRemoteDataSourceImpl(getItInstance()));

  // getItInstance.registerLazySingleton<CategoryRepository>(() =>
  //     CategoryRepositoryImpl(
  //         hiveService: HiveService(),
  //         remoteDataSource: CategoryRemoteDataSourceImpl(getItInstance())));

  // getItInstance
  //     .registerFactory(() => CategoryBloc(getCategories: getItInstance()));
}
