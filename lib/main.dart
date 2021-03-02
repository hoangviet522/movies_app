import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:hive/hive.dart';
import 'package:mygarment/data/tables/category_table.dart';
import 'package:mygarment/presentation/journeys/authentication/sign_in/sign_in_screen.dart';
import 'package:mygarment/presentation/journeys/home/home_screen.dart';
import 'package:mygarment/presentation/journeys/splash/splash_screen.dart';
import 'presentation/movie_app.dart';
import 'package:pedantic/pedantic.dart';
import 'di/get_it.dart' as getIt;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import './common/screenutil/screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  final appDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);

  Hive.registerAdapter(CategoryTableAdapter());
  ScreenUtil.init();

  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // runApp(MyGarment());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      home:
          (GetStorage().read('logged') != null) ? HomeScreen() : SplashScreen(),
    ),
  );
}
