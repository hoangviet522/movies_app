import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/presentation/journeys/edit_profile/edit_profile_screen.dart';
import 'package:mygarment/presentation/journeys/edit_profile/navigation_list_info.dart';
import 'package:mygarment/presentation/journeys/profile/navigation_divider.dart';
import 'package:mygarment/presentation/journeys/profile/navigation_list_item.dart';
import 'package:mygarment/presentation/journeys/profile/navigation_user_info_item.dart';
import 'package:mygarment/presentation/widgets/default_button.dart';
import 'package:mygarment/common/extensions/size_extensions.dart';
import 'package:mygarment/common/extensions/string_extensions.dart';

class ProfileInfoScreen extends StatefulWidget {
  // const ProfileScreen();

  @override
  _ProfileInfoScreenState createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            'User Information',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: ScreenUtil.screenHeight * 0.3,
              color: Colors.lightBlue,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      // top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
                      left: Sizes.padding_horizontal.w,
                      right: Sizes.padding_horizontal.w,
                    ),
                    height: ScreenUtil.screenHeight * 0.3 - 40,
                    child: NavigationUserInfoItemWidget(
                      fullname: 'Nguyễn Việt Cường',
                      username: 'CuongLTV',
                      isVIPUser: true,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: Sizes.padding_horizontal.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        NavigationListInfo(
                          info: TranslationConstants.male.t(context),
                          icon: FontAwesomeIcons.male,
                        ),
                        NavigationDivider(),
                        NavigationListInfo(
                          info: "15/12/2000",
                          icon: FontAwesomeIcons.birthdayCake,
                        ),
                        NavigationDivider(),
                        NavigationListInfo(
                          info: "0399518248",
                          icon: FontAwesomeIcons.phoneAlt,
                        ),
                        NavigationDivider(),
                        NavigationListInfo(
                          info: "IT",
                          icon: FontAwesomeIcons.briefcase,
                        ),
                        NavigationDivider(),
                        NavigationListInfo(
                          info: "523a, Đỗ Xuân Hợp",
                          icon: FontAwesomeIcons.home,
                        ),
                        SizedBox(
                          height: Sizes.dimen_8.h,
                        ),
                        DefaultButtonWidget(
                          color: Colors.lightBlue,
                          textColor: Colors.white,
                          title: TranslationConstants.updateProfile.t(context),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    EditProfileScreen(),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: Sizes.dimen_14.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
