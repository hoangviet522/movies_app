import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class CategoryEntity extends Equatable {
  final String title;
  final String backgroundPath;
  final int order;
  final String id;
  final bool lock;

  CategoryEntity({
    @required this.title,
    @required this.backgroundPath,
    @required this.order,
    @required this.id,
    @required this.lock,
  }) : assert(id != null, 'id cannot be null');

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
