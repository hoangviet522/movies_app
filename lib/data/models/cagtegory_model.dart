import 'package:mygarment/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  final String id;
  final dynamic creDt;
  final String title;
  final String background;
  final String desc;
  final int order;
  final bool lock;
  final String creUsrId;
  final String updUsrId;
  final bool actFlg;
  final bool delFlg;
  final dynamic updDt;

  CategoryModel({
    this.id,
    this.creDt,
    this.title,
    this.background,
    this.desc,
    this.order,
    this.lock,
    this.creUsrId,
    this.updUsrId,
    this.actFlg,
    this.delFlg,
    this.updDt,
  }) : super(
          id: id,
          order: order,
          lock: lock,
          backgroundPath: background,
          title: title,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      creDt: json['creDt'],
      title: json['title'],
      background: json['background'],
      desc: json['desc'],
      order: json['order'],
      lock: json['lock'],
      creUsrId: json['creUsrId'],
      updUsrId: json['updUsrId'],
      actFlg: json['actFlg'],
      delFlg: json['delFlg'],
      updDt: json['updDt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['creDt'] = this.creDt;
    data['title'] = this.title;
    data['background'] = this.background;
    data['desc'] = this.desc;
    data['order'] = this.order;
    data['lock'] = this.lock;
    data['creUsrId'] = this.creUsrId;
    data['updUsrId'] = this.updUsrId;
    data['actFlg'] = this.actFlg;
    data['delFlg'] = this.delFlg;
    data['updDt'] = this.updDt;
    return data;
  }
}
