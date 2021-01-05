import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/presentation/journeys/welcome/welcome_item_model.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

class WelcomeScreenContent extends StatelessWidget {
  final WelcomeItemModel item;

  const WelcomeScreenContent({Key key, @required this.item}) : super(key: key);

  get i => null;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset(
              // 'assets/jpgs/${WelcomeItemConstant.welcomeItems[i].imagePath}',
              'assets/jpgs/welcome_1.jpg',
            ),
          ),
          SizedBox(
            height: Sizes.dimen_12.h,
          ),
          Text(
            item.title,
            style: Theme.of(context).textTheme.lightBlueHeadline4,
          ),
          Text(
            item.text,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
