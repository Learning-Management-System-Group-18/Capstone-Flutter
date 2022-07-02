import 'package:capstone_flutter/api/service.dart';
import 'package:capstone_flutter/models/mentor_model.dart';

import 'package:dio/dio.dart';

class MentorRepository {
  final ApiService apiService = ApiService();
  List<Data>? listdatamentor;

  Future<List<Data>?> getMentorByCourseId({required int courseId}) async {
    Mentor mentor;
    var parameter = {"courseId": courseId};
    try {
      Response response = await apiService.dio
          .get(apiService.baseUrl + 'mentors', queryParameters: parameter);
      if (response.statusCode == 200) {
        mentor = Mentor.fromJson(response.data);
        listdatamentor = mentor.data;
        return listdatamentor;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return listdatamentor;
  }
}
