import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import '../themes/theme_text.dart';

import '../../common/extensions/size_extensions.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.white,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: <Color>[Colors.blue[600], Colors.lightBlue[300]])),
      ),

      title: Text(
        title,
        style:
            Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white),
      ),
      automaticallyImplyLeading: true,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(Sizes.dimen_18.h);
}
