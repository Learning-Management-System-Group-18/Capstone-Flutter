import 'package:capstone_flutter/api/service.dart';
import 'package:capstone_flutter/models/content_model.dart';

import 'package:dio/dio.dart';

class ContentRepository {
  final ApiService apiService = ApiService();
  Data? dataContent;

  Future<Data?> getAllContentBySectionId({required int sectionId}) async {
    Content content;
    var parameter = {
      "sectionId": sectionId,
      "page": 1,
      "size": 3,
    };
    try {
      Response response = await apiService.dio
          .get(apiService.baseUrl + 'content', queryParameters: parameter);
      if (response.statusCode == 200) {
        content = Content.fromJson(response.data);
        dataContent = content.data;
        print('content(video) : ${dataContent?.video}');
        print('content(slide) : ${dataContent?.slide}');
        print('content(quiz) : ${dataContent?.quiz}');
        return dataContent;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return dataContent;
  }
}
