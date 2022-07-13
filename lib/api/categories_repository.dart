import 'package:capstone_flutter/api/service.dart';
import 'package:capstone_flutter/models/categories_model.dart';
import 'package:dio/dio.dart';

class CategoriesRepository {
  final ApiService apiService = ApiService();
  List<Data>? listdatacategories;

  Future<List<Data>?> getDataCategories() async {
    Categories? dataCategories;

    var parameter = {"page": 1};
    try {
      Response response = await apiService.dio
          .get(apiService.baseUrl + 'categories', queryParameters: parameter);
      if (response.statusCode == 200) {
        dataCategories = Categories.fromJson(response.data);
        listdatacategories = dataCategories.data;
        return listdatacategories;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return listdatacategories;
  }
}
