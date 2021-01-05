import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygarment/di/get_it.dart';
import 'package:mygarment/presentation/blocs/splash_screen/splash_screen_bloc.dart';
import 'package:mygarment/presentation/journeys/home/home_screen.dart';
import 'package:mygarment/presentation/journeys/select_language/select_language_screen.dart';
import 'package:mygarment/presentation/journeys/welcome/welcome_screen.dart';
import 'package:mygarment/presentation/widgets/logo.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenBloc _splashScreenBloc;

  @override
  void initState() {
    _splashScreenBloc = getItInstance<SplashScreenBloc>();
    _splashScreenBloc.add(SetSplash());
    super.initState();
  }

  @override
  void dispose() {
    _splashScreenBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => _splashScreenBloc,
        child: BlocListener<SplashScreenBloc, SplashScreenState>(
          listener: (context, state) {
            if (state is LoadedHome) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen(),
                ),
              );
            } else if (state is LoadedSelectLanguage) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SelectLanguageScreen(),
                ),
              );
            }
          },
          child: Container(
            color: Colors.white,
            child: Center(
                child: Logo(
              height: 100,
            )),
          ),
        ),
      ),
    );
  }
}
