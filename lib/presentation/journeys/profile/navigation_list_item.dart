import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationListItem extends StatelessWidget {
  final String title;
  final Function onPressed;
  final IconData icon;

  const NavigationListItem(
      {Key key,
      @required this.title,
      @required this.onPressed,
      @required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.transparent,
              blurRadius: 2,
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          leading: Icon(
            icon,
            size: 18,
            color: Colors.black.withOpacity(0.8),
          ),
          trailing: Icon(
            FontAwesomeIcons.caretRight,
            color: Colors.black54,
            size: 18,
          ),
        ),
      ),
    );
  }
}
