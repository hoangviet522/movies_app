import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class VideoEntity extends Equatable {
  final String id;
  final String iso_639_1;
  final String iso_3166_1;
  final String key;
  final String name;
  final String site;
  final int size;
  final String type;

  VideoEntity(
      {@required this.id,
      @required this.iso_639_1,
      @required this.iso_3166_1,
      @required this.key,
      @required this.name,
      @required this.site,
      @required this.size,
      @required this.type})
      : assert(id != null, "Video id must not be null");

  @override
  List<Object> get props => [id, key];

  @override
  bool get stringify => true;
}
