import 'package:flutter/material.dart';

class BottomBarItem {
  final int index;
  final String title;
  final String  icon;

  BottomBarItem(
      {@required this.index, @required this.title, @required this.icon})
      : assert(index >= 0, 'index canot be negative'),
        assert(title != null, 'title cannot be empty'),
        assert(icon != null, 'icon cannot be empty');
}
