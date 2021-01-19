import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/data/models/movie.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import 'package:mygarment/presentation/widgets/logo.dart';

import '../../themes/theme_text.dart';
import '../../../common/extensions/size_extensions.dart';

class NavigationListItem extends StatelessWidget {
  final String title;
  final Function onPressed;

  const NavigationListItem(
      {Key key, @required this.title, @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(
            title,
            style: Theme.of(context).textTheme.whiteBoldSubtitle1,
          ),
        ),
      ),
    );
  }
}
