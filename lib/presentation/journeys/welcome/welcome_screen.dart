import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/presentation/journeys/authentication/sign_in/sign_in_screen.dart';
import 'package:mygarment/presentation/journeys/home/home_screen.dart';
import 'package:mygarment/presentation/journeys/welcome/next_button_widget.dart';
import 'package:mygarment/presentation/journeys/welcome/welcome_item_constant.dart';
import 'package:mygarment/presentation/journeys/welcome/welcome_screen_content.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../common/extensions/string_extensions.dart';

import '../../themes/theme_text.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: FlatButton(
                onPressed: () => goToSignInScreen(context),
                child: Text(
                  TranslationConstants.skip.t(context),
                  style: Theme.of(context).textTheme.boldSubtitle1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: Sizes.dimen_32.h, top: Sizes.dimen_12.h),
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        for (var i = 0;
                            i < WelcomeItemConstant.welcomeItems.length;
                            i++)
                          WelcomeScreenContent(
                            item: WelcomeItemConstant.welcomeItems[i],
                          )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => buildDot(index: index),
                    ),
                  ),
                ],
              ),
            ),
            // ),
            _currentPage != WelcomeItemConstant.welcomeItems.length - 1
                ? NextButtonWidget(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                  )
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () => goToSignInScreen(context),
                      child: Container(
                        height: Sizes.dimen_18.h,
                        width: Sizes.dimen_200.w,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            TranslationConstants.getStarted.t(context),
                            style: Theme.of(context).textTheme.whiteHeadline6,
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(
        right: Sizes.dimen_6.w,
      ),
      height: Sizes.dimen_4.h,
      width: _currentPage == index ? Sizes.dimen_8.h : Sizes.dimen_4.h,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? Theme.of(context).primaryColor
            : Color(0xFFB0BEC5),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  void goToSignInScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }
}
