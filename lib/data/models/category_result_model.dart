import 'cagtegory_model.dart';

class CategoryResultModel {
  List<CategoryModel> categories;

  CategoryResultModel({this.categories});

  CategoryResultModel.fromJson(Map<String, dynamic> json) {
    if (json['data']['results'] != null) {
      categories = new List<CategoryModel>();
      json['data']['results'].forEach((v) {
        categories.add(new CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.categories != null) {
      data['results'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
