import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mygarment/data/core/hive_service.dart';
import 'package:mygarment/data/remote_data_sources/category_remote_data_source.dart';
import 'package:mygarment/data/repositories/category_repository_impl.dart';
import 'package:mygarment/domain/repositories/category_repository.dart';
import 'package:mygarment/domain/usecases/get_categories.dart';
import 'package:mygarment/presentation/blocs/category/category_bloc.dart';
import 'package:mygarment/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:mygarment/presentation/blocs/splash_screen/splash_screen_bloc.dart';
import '../data/core/api_client.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance.registerLazySingleton<HiveService>(() => HiveService());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerFactory(() => SplashScreenBloc());

  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());

  //category di

  getItInstance.registerLazySingleton<GetCategories>(
      () => GetCategories(getItInstance()));

  getItInstance.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<CategoryRepository>(() =>
      CategoryRepositoryImpl(
          hiveService: HiveService(),
          remoteDataSource: CategoryRemoteDataSourceImpl(getItInstance())));

  getItInstance
      .registerFactory(() => CategoryBloc(getCategories: getItInstance()));
}
