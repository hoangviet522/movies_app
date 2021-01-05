import 'package:flutter/material.dart';

class NavigationListInfo extends StatelessWidget {
  final String info;

  final IconData icon;

  const NavigationListInfo({Key key, @required this.info, @required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            info,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          leading: Icon(
            icon,
            size: 18,
            color: Colors.black.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
