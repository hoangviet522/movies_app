import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mygarment/common/constants/languages.dart';
import 'package:mygarment/di/get_it.dart';
import 'package:mygarment/presentation/app_localizations.dart';
import 'package:mygarment/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:mygarment/presentation/journeys/authentication/sign_in/sign_in_screen.dart';
import 'package:mygarment/presentation/journeys/home/home_screen.dart';
import 'package:mygarment/presentation/journeys/splash/splash_screen.dart';
import '../common/screenutil/screenutil.dart';
import 'themes/theme_color.dart';
import 'themes/theme_text.dart';

class MyGarment extends StatefulWidget {
  @override
  _MyGarmentState createState() => _MyGarmentState();
}

class _MyGarmentState extends State<MyGarment> {
  // LanguageBloc _languageBloc;

  @override
  void initState() {
    // _languageBloc = getItInstance<LanguageBloc>();
    super.initState();
  }

  @override
  void dispose() {
    // _languageBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Garment',
      theme: ThemeData(
        primaryColor: AppColor.lightBlue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),

      // home: HomeScreen(),
      home: SignInScreen(),
      // home: SplashScreen(),
    );
  }
}
