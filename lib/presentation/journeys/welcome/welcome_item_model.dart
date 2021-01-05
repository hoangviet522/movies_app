import 'package:flutter/foundation.dart';

class WelcomeItemModel {
  final int index;
  final String text;
  final String title;
  final String imagePath;

  WelcomeItemModel(
      {@required this.index,
      @required this.text,
      @required this.imagePath,
      @required this.title})
      : assert(index >= 0, 'index cannot be negative'),
        assert(text != null, 'intro text cannot be null'),
        assert(imagePath != null, 'imagePath cannot be null'),
        assert(title != null, 'title cannot be null');
}
