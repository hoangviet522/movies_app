import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/common/extensions/string_extensions.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/presentation/widgets/app_bar_widget.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

class PolicyScreen extends StatefulWidget {
  @override
  _PolicyScreenState createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.lightBlue,
      //   automaticallyImplyLeading: true,
      //   iconTheme: IconThemeData(
      //     color: Colors.white,
      //   ),
      //   title: Text(
      //     TranslationConstants.ruleAndPolicy.t(context),
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      appBar: AppBarWidget(
        title: TranslationConstants.ruleAndPolicy.t(context),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_14.w,
          vertical: Sizes.dimen_14.h,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.questionCircle,
                  color: Colors.brown,
                ),
                SizedBox(
                  width: Sizes.dimen_10,
                ),
                Flexible(
                  child: Text(
                    TranslationConstants.generalPolicy.t(context),
                    style: Theme.of(context).textTheme.boldSubtitle1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Sizes.dimen_8.h,
            ),
            Divider(),
            ExpansionTile(
              title: Text(TranslationConstants.rules1.t(context)),
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: Sizes.dimen_20),
                  child: Text(
                    TranslationConstants.rulesDetail1.t(context),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(TranslationConstants.rules2.t(context)),
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: Sizes.dimen_20),
                  child: Column(
                    children: [
                      Text(
                        TranslationConstants.rulesDetail2.t(context),
                      ),
                      SizedBox(
                        height: Sizes.dimen_14,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "2.1    ",
                          ),
                          Flexible(
                            child:
                                Text(TranslationConstants.rules21.t(context)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Sizes.dimen_14,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "2.2    ",
                          ),
                          Flexible(
                            child:
                                Text(TranslationConstants.rules22.t(context)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Sizes.dimen_14,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "2.3    ",
                          ),
                          Flexible(
                            child:
                                Text(TranslationConstants.rules23.t(context)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
