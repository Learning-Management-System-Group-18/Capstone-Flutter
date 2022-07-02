import 'package:capstone_flutter/api/service.dart';
import 'package:capstone_flutter/models/section_model.dart';

import 'package:dio/dio.dart';

class SectionRepository {
  final ApiService apiService = ApiService();
  List<Data>? listsection;

  Future<List<Data>?> getAllSectionByCourseId({required int courseId}) async {
    Section section;
    var parameter = {
      "courseId": courseId,
      "page": 1,
      "size": 5,
    };
    try {
      Response response = await apiService.dio
          .get(apiService.baseUrl + 'sections', queryParameters: parameter);
      if (response.statusCode == 200) {
        section = Section.fromJson(response.data);
        listsection = section.data;
        return listsection;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return listsection;
  }
}
