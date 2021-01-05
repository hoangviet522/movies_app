import 'package:flutter/material.dart';
import 'package:mygarment/domain/entities/language_entity.dart';
import 'package:mygarment/presentation/journeys/profile/navigation_sub_list_item.dart';

class NavigationExpandedListItem extends StatelessWidget {
  final String title;
  final Function onPressed;
  final List<LanguageEntity> childrends;
  final IconData icon;

  const NavigationExpandedListItem(
      {Key key,
      @required this.title,
      @required this.onPressed,
      @required this.childrends,
      @required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
            blurRadius: 2,
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        leading: Icon(
          icon,
          size: 18,
          color: Colors.black.withOpacity(0.8),
        ),
        children: <Widget>[
          for (int i = 0; i < childrends.length; i++)
            NavigationSubListItem(
              title: childrends[i].value,
              onPressed: () => onPressed(i),
              icon: childrends[i].imagePath,
            ),
        ],
      ),
    );
  }
}
