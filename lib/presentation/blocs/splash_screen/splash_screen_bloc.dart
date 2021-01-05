import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial());

  @override
  Stream<SplashScreenState> mapEventToState(
    SplashScreenEvent event,
  ) async* {
    if (event is SetSplash) {
      yield Loading();

      // final _authToken = sharedPrefs.token ?? "";
      // if (_authToken.isEmpty) {
      //   yield LoadedSelectLanguage();
      // }
      await Future.delayed(Duration(seconds: 3));
      yield LoadedHome();
    }
  }
}
