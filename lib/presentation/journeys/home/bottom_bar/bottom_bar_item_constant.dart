import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mygarment/common/constants/translation_constant.dart';

import 'bottom_bar_item_model.dart';

class BottomBarItemConstant {
  static List<BottomBarItem> bottomMenuItems = [
    BottomBarItem(
      index: 0,
      // title: TranslationConstants.onlineLearning,
      icon: 'assets/svgs/home2.svg',
    ),
    BottomBarItem(
      index: 1,
      // title: TranslationConstants.topic,
      icon: 'assets/svgs/zoom.svg',
    ),
    BottomBarItem(
      index: 2,
      // title: TranslationConstants.search,
      icon: 'assets/svgs/User Icon.svg',
    ),
  ];
}
