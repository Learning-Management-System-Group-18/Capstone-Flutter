import 'dart:convert';

import 'package:capstone_flutter/api/service.dart';
import 'package:capstone_flutter/models/course_model.dart' as m_course;
import 'package:capstone_flutter/models/coursedetail_model.dart'
    as m_coursedetail;
import 'package:dio/dio.dart';

class CourseRepository {
  final ApiService apiService = ApiService();
  List<m_course.Data>? listdatacourse;
  List<m_course.Data>? listdatasearch;
  List<m_course.Data>? listdatapopular;
  m_coursedetail.Data? datacourse;

  Future<List<m_course.Data>?> getAllCourse() async {
    m_course.Course? dataCourse;

    var parameter = {"page": 0};
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

    var parameter = {"categoryId": categoryId, "page": 0};
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

  Future<List<m_course.Data>?> getCoursePopular() async {
    m_course.Course? dataCourse;
    try {
      Response response =
          await apiService.dio.get(apiService.baseUrl + 'course/popular');
      if (response.statusCode == 200) {
        dataCourse = m_course.Course.fromJson(response.data);
        listdatapopular = dataCourse.data;
        return listdatapopular;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return listdatapopular;
  }

  Future<List<m_course.Data>?> postSearchCourse(String? value) async {
    m_course.Course? dataCourse;
    var body = {
      "filters": [
        {
          "key": "title",
          "operator": "LIKE",
          "field_type": "STRING",
          "value": value,
        }
      ]
    };
    try {
      Response response = await apiService.dio.post(
        apiService.baseUrl + 'course/search',
        data: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        dataCourse = m_course.Course.fromJson(response.data);
        listdatasearch = dataCourse.data;
        print(listdatasearch);
        return listdatasearch;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return listdatasearch;
  }
}
