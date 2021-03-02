import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/presentation/journeys/category/category_screen.dart';
import 'package:mygarment/presentation/journeys/main_lobby/main_lobby.dart';
import 'package:mygarment/presentation/journeys/policy/policy_screen.dart';
import 'package:mygarment/presentation/journeys/profile/profile_screen.dart';
import 'package:mygarment/presentation/journeys/search_screen/search_screen.dart';
import '../../../common/extensions/size_extensions.dart';
import 'bottom_bar/bottom_bar_item_constant.dart';
import 'bottom_bar/bottom_bar_item_widget.dart';

import 'components/movie_carousel.dart';
import 'components/movie_image_carousel_top_bar.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({Key key, this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  int selectedCate = 0;
  // List<Widget> _children = [ProfileScreen()];

  bool active = true;

  List<Widget> _children = [
    MainLobby(),
    SearchScreen(),
    ProfileScreen(),
  ];

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
    // print("aaa ${widget.user}");
    return Scaffold(
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
    int tabIndex = index;
    setState(() {
      currentIndex = tabIndex;
    });
  }
}
