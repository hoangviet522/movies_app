import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mygarment/data/models/splash_model.dart';
import 'package:mygarment/presentation/journeys/authentication/sign_in/sign_in_screen.dart';
import 'package:mygarment/presentation/journeys/home/home_screen.dart';

class SplashController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == splashPage.length - 1;

  // nextPage() {
  //   if (isLastPage && GetStorage().read('logged') == null) {
  //     Get.to(LoginPage());
  //   } else if (isLastPage && GetStorage().read('logged') != null) {
  //     Get.offAll(HomePage());
  //   } else {
  //     pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  //   }
  // }
  nextPage() {
    if (isLastPage && (GetStorage().read('logged') == null)) {
      Get.offAll(SignInScreen());
    } else if (isLastPage && (GetStorage().read('logged') != null)) {
      Get.offAll(HomeScreen());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<SplashModel> splashPage = [
    SplashModel(
      imgAsset: 'assets/jpgs/splash_movie_4.jpg',
      title: 'Make Your Plan',
      desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
    ),
    SplashModel(
      imgAsset: 'assets/jpgs/splash_movie_3.jpg',
      title: 'Let Shopping',
      desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
    ),
    SplashModel(
      imgAsset: 'assets/jpgs/splash_movie_2.jpg',
      title: 'Make Your Plan',
      desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
    ),
  ];
}
