import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/presentation/journeys/profile/profile_screen.dart';
import '../../../common/extensions/size_extensions.dart';
import 'bottom_bar/bottom_bar_item_constant.dart';
import 'bottom_bar/bottom_bar_item_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 2;
  List<Widget> _children = [ProfileScreen()];

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
      // body: _children[currentIndex],
      body: Container(
        child: Text('home page'),
      ),
      // floatingActionButton: IconButton(
      //     icon: SvgPicture.asset('assets/svgs/microphone.svg'),
      //     onPressed: () {}),

      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.only(
          bottom: Sizes.dimen_1.h,
          left: Sizes.dimen_10.w,
          right: Sizes.dimen_10.w,
        ),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            for (var i = 0;
                i < BottomBarItemConstant.bottomMenuItems.length;
                i++)
              BottomBarItemWidget(
                icon: BottomBarItemConstant.bottomMenuItems[i].icon,
                title: BottomBarItemConstant.bottomMenuItems[i].title,
                onPress: () => onScreenTabbed(i, context),
                active: currentIndex == i,
              )
          ],
        ),
      ),
    );
  }

  void onScreenTabbed(int index, BuildContext context) {
    int tabIndex = index == 0 ? 2 : index;
    if (index == 0) {
      _launchURL();
    }
    setState(() {
      currentIndex = tabIndex;
    });
  }

  _launchURL() async {
    String url = 'http://gitedu.vn/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
