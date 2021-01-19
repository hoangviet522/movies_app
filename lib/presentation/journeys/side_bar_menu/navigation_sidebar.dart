import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/data/models/movie.dart';
import 'package:mygarment/presentation/journeys/side_bar_menu/navigation_list_item.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import 'package:mygarment/presentation/widgets/logo.dart';

import '../../themes/theme_text.dart';
import '../../../common/extensions/size_extensions.dart';

class NavigationSidebar extends StatefulWidget {
  const NavigationSidebar();

  @override
  _NavigationSidebarState createState() => _NavigationSidebarState();
}

class _NavigationSidebarState extends State<NavigationSidebar> {
  bool switchedInfoHide = false;
  bool switchedNotices = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_340.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff131221).withOpacity(0.9),
            // blurRadius: 4,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Sizes.dimen_20.w,
              top: Sizes.dimen_10.h,
              right: Sizes.dimen_14.w,
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.1),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Logo(
                    height: Sizes.dimen_4.h,
                  ),
                  SizedBox(
                    height: Sizes.dimen_14.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Sizes.dimen_40.h,
                        width: Sizes.dimen_40.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://i.pinimg.com/474x/61/1f/80/611f80f286b2793b5413819baa375d36.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Sizes.dimen_10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lili Reinhart",
                            style: Theme.of(context).textTheme.whiteHeadline6,
                          ),
                          Text(
                            "Type What In Your Mind..?",
                            style: TextStyle(
                                color: AppColor.violet,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Sizes.dimen_14.h,
                  ),
                ],
              ),
              // ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: Sizes.dimen_20.w,
              top: Sizes.dimen_4.h,
              // right: Sizes.dimen_14.w,
            ),
            child: Column(
              children: [
                NavigationListItem(
                  title: "Your Favorite",
                  onPressed: () {},
                ),
                Divider(
                  color: Colors.grey,
                ),
                NavigationListItem(
                  title: "Share Your Profile",
                  onPressed: () {},
                ),
                Divider(
                  color: Colors.grey,
                ),
                NavigationListItem(
                  title: "Rate Us",
                  onPressed: () {},
                ),
                SizedBox(
                  height: Sizes.dimen_14.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hide Your Profile",
                      style: Theme.of(context).textTheme.whiteBoldSubtitle1,
                    ),
                    Switch(
                      activeColor: AppColor.violet,
                      inactiveTrackColor: Colors.grey,
                      value: switchedInfoHide,
                      onChanged: (bool value) {
                        setState(() {
                          switchedInfoHide = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notices",
                      style: Theme.of(context).textTheme.whiteBoldSubtitle1,
                    ),
                    Switch(
                      activeColor: AppColor.violet,
                      inactiveTrackColor: Colors.grey,
                      value: switchedNotices,
                      onChanged: (bool value) {
                        setState(() {
                          switchedNotices = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: Sizes.dimen_14.h,
                ),
                NavigationListItem(
                  title: "Settings",
                  onPressed: () {},
                ),
                Divider(
                  color: Colors.grey,
                ),
                NavigationListItem(
                  title: "About App",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
