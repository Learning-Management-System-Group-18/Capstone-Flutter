import 'package:capstone_flutter/api/service.dart';
import 'package:capstone_flutter/models/tools_model.dart';

import 'package:dio/dio.dart';

class ToolsRepository {
  final ApiService apiService = ApiService();
  List<Data>? listdatatool;

  Future<List<Data>?> getToolsByCourseId({required int courseId}) async {
    Tools tool;
    var parameter = {"courseId": courseId};
    try {
      Response response = await apiService.dio
          .get(apiService.baseUrl + 'tools', queryParameters: parameter);
      if (response.statusCode == 200) {
        tool = Tools.fromJson(response.data);
        listdatatool = tool.data;
        return listdatatool;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return listdatatool;
  }
}
