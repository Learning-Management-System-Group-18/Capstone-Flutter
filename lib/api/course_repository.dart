import 'package:capstone_flutter/api/service.dart';
import 'package:capstone_flutter/models/course_model.dart' as m_course;
import 'package:capstone_flutter/models/coursedetail_model.dart'
    as m_coursedetail;
import 'package:dio/dio.dart';

class CourseRepository {
  final ApiService apiService = ApiService();
  List<m_course.Data>? listdatacourse;
  m_coursedetail.Data? datacourse;

  Future<List<m_course.Data>?> getAllCourse() async {
    m_course.Course? dataCourse;

    var parameter = {"page": 1, "size": 5};
    try {
      Response response = await apiService.dio
          .get(apiService.baseUrl + 'courses', queryParameters: parameter);
      if (response.statusCode == 200) {
        dataCourse = m_course.Course.fromJson(response.data);
        listdatacourse = dataCourse.data;
        print(listdatacourse);
        return listdatacourse;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return listdatacourse;
  }

  Future<m_coursedetail.Data?> getCourseById({required int id}) async {
    m_coursedetail.CourseDetail detailCourse;

    var parameter = {"id": id};
    try {
      Response response = await apiService.dio
          .get(apiService.baseUrl + 'course', queryParameters: parameter);
      if (response.statusCode == 200) {
        detailCourse = m_coursedetail.CourseDetail.fromJson(response.data);
        datacourse = detailCourse.data;
        return datacourse;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return datacourse;
  }

  Future<List<m_course.Data>?> getCourseByCategoryId(
      {required int categoryId}) async {
    m_course.Course? dataCourse;

    var parameter = {"categoryId": categoryId, "page": 1, "size": 5};
    try {
      Response response = await apiService.dio
          .get(apiService.baseUrl + 'courses', queryParameters: parameter);
      if (response.statusCode == 200) {
        dataCourse = m_course.Course.fromJson(response.data);
        listdatacourse = dataCourse.data;
        return listdatacourse;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return listdatacourse;
  }
}
