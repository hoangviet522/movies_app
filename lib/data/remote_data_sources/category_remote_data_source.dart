import 'package:mygarment/data/core/api_client.dart';
import 'package:mygarment/data/models/cagtegory_model.dart';
import 'package:mygarment/data/models/category_result_model.dart';
import 'package:mygarment/data/tables/category_mock_data.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getListCategories();
}

class CategoryRemoteDataSourceImpl extends CategoryRemoteDataSource {
  final ApiClient _client;

  CategoryRemoteDataSourceImpl(this._client);

  @override
  Future<List<CategoryModel>> getListCategories() async {
    final response = await _client.get('allCate');
    final categories = CategoryResultModel.fromJson(response).categories;
    return categories;
  }
}
