import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mygarment/common/constants/languages.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/common/extensions/size_extensions.dart';
import 'package:mygarment/common/extensions/string_extensions.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:mygarment/presentation/journeys/authentication/sign_in/sign_in_screen.dart';
import 'package:mygarment/presentation/journeys/edit_profile/profile_info_screen.dart';
import 'package:mygarment/presentation/journeys/policy/policy_screen.dart';
import 'package:mygarment/presentation/journeys/profile/naviagation_expanded_list_item.dart';
import 'package:mygarment/presentation/journeys/profile/navigation_divider.dart';
import 'package:mygarment/presentation/journeys/profile/navigation_list_item.dart';
import 'package:mygarment/presentation/journeys/profile/navigation_user_info_item.dart';
import 'package:mygarment/presentation/themes/theme_text.dart';
import 'package:mygarment/presentation/widgets/default_button.dart';
import 'package:mygarment/presentation/widgets/logo.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: ScreenUtil.screenHeight * 0.33,
              color: Colors.lightBlue,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
                      left: Sizes.padding_horizontal.w,
                      right: Sizes.padding_horizontal.w,
                    ),
                    height: ScreenUtil.screenHeight * 0.33 - 40,
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
                        NavigationListItem(
                          title: TranslationConstants.editProfile.t(context),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ProfileInfoScreen(),
                              ),
                            );
                          },
                          icon: FontAwesomeIcons.addressBook,
                        ),
                        NavigationDivider(),
                        NavigationListItem(
                          title: TranslationConstants.wordPackages.t(context),
                          onPressed: () {},
                          icon: FontAwesomeIcons.archive,
                        ),
                        NavigationDivider(),
                        NavigationListItem(
                          title:
                              TranslationConstants.translateHistory.t(context),
                          onPressed: () {},
                          icon: FontAwesomeIcons.history,
                        ),
                        NavigationDivider(),
                        NavigationListItem(
                          title: TranslationConstants.feedback.t(context),
                          onPressed: () {},
                          icon: FontAwesomeIcons.comments,
                        ),
                      ],
                    ),
                  ),
                  //section 2
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: Sizes.padding_horizontal.w,
                      vertical: Sizes.dimen_8.h,
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
                        ListTile(
                          leading: Text(
                            TranslationConstants.setting.t(context),
                            style: Theme.of(context).textTheme.boldSubtitle1,
                          ),
                        ),
                        NavigationDivider(),
                        NavigationListItem(
                          title: TranslationConstants.appReview.t(context),
                          onPressed: () {},
                          icon: FontAwesomeIcons.star,
                        ),
                        NavigationDivider(),
                        NavigationExpandedListItem(
                          title: TranslationConstants.language.t(context),
                          onPressed: (index) {
                            BlocProvider.of<LanguageBloc>(context).add(
                                ToggleLanguageEvent(
                                    Languages.languages[index]));
                          },
                          icon: FontAwesomeIcons.globe,
                          childrends:
                              Languages.languages.map((e) => e).toList(),
                        ),
                        NavigationDivider(),
                        NavigationListItem(
                          title: TranslationConstants.ruleAndPolicy.t(context),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    PolicyScreen(),
                              ),
                            );
                          },
                          icon: FontAwesomeIcons.fileAlt,
                        ),
                        NavigationDivider(),
                        NavigationListItem(
                          title: TranslationConstants.logout.t(context),
                          icon: FontAwesomeIcons.signOutAlt,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SignInScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  //section 3
                  Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Developed By',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: Sizes.padding_vertical.h,
                        ),
                        Logo(
                          height: Sizes.dimen_8.h,
                        ),
                        SizedBox(
                          height: Sizes.padding_vertical.h,
                        ),
                        Text('@ Copyright GIT 2020'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Sizes.dimen_12.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
