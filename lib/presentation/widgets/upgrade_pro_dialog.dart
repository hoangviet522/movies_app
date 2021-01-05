import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import '../themes/theme_text.dart';
import '../../common/extensions/size_extensions.dart';
import '../../common/extensions/string_extensions.dart';

class UpgradeProDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: Sizes.padding_horizontal.w,
                top: 50,
                right: Sizes.padding_horizontal.w,
                bottom: 20),
            margin: EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  TranslationConstants.upgradeToPro.t(context),
                  style: Theme.of(context).textTheme.boldSubtitle1,
                ),
                SizedBox(
                  height: Sizes.dimen_2.h,
                ),
                Text(
                  TranslationConstants.upgradeDesc.t(context),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  width: ScreenUtil.screenWidth * 0.6,
                  padding: EdgeInsets.only(
                    top: Sizes.dimen_4.h,
                    left: Sizes.dimen_4.w,
                    right: Sizes.dimen_4.w,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(top: BorderSide(color: AppColor.borderColor))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          TranslationConstants.notNow.t(context),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          TranslationConstants.upgradeNow.t(context),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: Colors.lightBlue),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                child: SvgPicture.asset('assets/svgs/system-update.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
