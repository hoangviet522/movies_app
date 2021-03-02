import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/controllers/firebase_controller.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';
import 'package:get/get.dart';

class ProfileInfo extends StatelessWidget {
  // const ProfileInfo({
  //   Key key,
  // }) : super(key: key);

  final FirebaseController firebaseController = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_44.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 0.4,
            child: Container(
              padding: EdgeInsets.only(left: Sizes.dimen_20.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl:
                      // 'https://i.pinimg.com/474x/61/1f/80/611f80f286b2793b5413819baa375d36.jpg',
                      firebaseController.imgUrl.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: 0.6,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.dimen_6.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // "Lili Reinhart",
                        firebaseController.userName.toString(),
                        style: Theme.of(context).textTheme.whiteBoldHeadline5,
                      ),
                      Text(
                        "Type What In Your Mind..?",
                        style: TextStyle(
                            color: AppColor.violet,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "100",
                            style: Theme.of(context).textTheme.violetSubtitle2,
                          ),
                          Text(
                            "Movie Watch",
                            style: TextStyle(
                              color: AppColor.royalBlue,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "1234",
                            style:
                                Theme.of(context).textTheme.whiteBoldSubtitle2,
                          ),
                          Text(
                            "Following",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "5648",
                            style:
                                Theme.of(context).textTheme.whiteBoldSubtitle2,
                          ),
                          Text(
                            "Followers",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
