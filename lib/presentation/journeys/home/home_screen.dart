import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/presentation/journeys/category/category_screen.dart';
import 'package:mygarment/presentation/journeys/main_lobby/main_lobby.dart';
import 'package:mygarment/presentation/journeys/policy/policy_screen.dart';
import 'package:mygarment/presentation/journeys/profile/profile_screen.dart';
import '../../../common/extensions/size_extensions.dart';
import 'bottom_bar/bottom_bar_item_constant.dart';
import 'bottom_bar/bottom_bar_item_widget.dart';

import 'components/movie_carousel.dart';
import 'components/movie_image_carousel_top_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  int selectedCate = 0;
  // List<Widget> _children = [ProfileScreen()];

  bool active = true;

  List<Widget> _children = [
    // TranslateScreen(),
    // SubjectScreen(),
    // TranslateScreen(),
    // NotificationScreen(),
    MainLobby(),
    ProfileScreen(),
    PolicyScreen(),
    CategoryScreen(),
  ];

  // int _selectedIndex = 0;
  // TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     // style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Business',
  //     // style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: School',
  //     // style: optionStyle,
  //   ),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   child: Text('home page'),
      // ),
      body: _children[currentIndex],

      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.only(
          bottom: Sizes.dimen_2.h,
          left: Sizes.dimen_32.w,
          right: Sizes.dimen_32.w,
        ),
        decoration: BoxDecoration(
          // boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
          color: Color(0xFF131221),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            for (var i = 0;
                i < BottomBarItemConstant.bottomMenuItems.length;
                i++)
              BottomBarItemWidget(
                icon: BottomBarItemConstant.bottomMenuItems[i].icon,
                // title: BottomBarItemConstant.bottomMenuItems[i].title,
                onPress: () => onScreenTabbed(i, context),
                active: currentIndex == i,
              )
          ],
        ),
      ),
    );
  }

  void onScreenTabbed(int index, BuildContext context) {
    // int tabIndex = index == 0 ? 0 : index;
    int tabIndex = index;

    // if (index == 0) {
    //   _launchURL();
    // }
    setState(() {
      currentIndex = tabIndex;
    });
  }
}
