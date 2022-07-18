import 'dart:io';

import 'package:capstone_flutter/api/response/response_order.dart';
import 'package:capstone_flutter/api/service.dart';
import 'package:capstone_flutter/models/order_model.dart' as m_order;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderRepository {
  final ApiService apiService = ApiService();
  ResponseOrder? responseOrder;
  List<m_order.Data>? listcourseOnGoing;
  List<m_order.Data>? listcourseCompleted;

  token_read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final token = prefs.getString(key) ?? '';
    return token;
  }

  Future<ResponseOrder?> orderCourse({required int courseId}) async {
    var parameter = {
      "courseId": courseId,
    };
    String token = await token_read();
    try {
      Response response = await apiService.dio.post(
        apiService.baseUrl + 'auth/order',
        queryParameters: parameter,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );
      print('response : ${response.statusCode}');
      if (response.statusCode == 200) {
        responseOrder = ResponseOrder.fromJson(response.data);
        return responseOrder;
      }
    } on DioError catch (e) {
      print('error : ${e.response?.statusCode}');
    }
    return responseOrder;
  }

  Future<List<m_order.Data>?> getAllCourseOnGoing() async {
    m_order.Order order;
    String token = await token_read();
    try {
      Response response = await apiService.dio.get(
        apiService.baseUrl + 'auth/order/ongoing',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );
      if (response.statusCode == 200) {
        order = m_order.Order.fromJson(response.data);
        listcourseOnGoing = order.data;
        return listcourseOnGoing;
      }
    } on DioError catch (e) {
      print(e.response?.statusCode);
    }
    return listcourseOnGoing;
  }

  Future<List<m_order.Data>?> getAllCourseCompleted() async {
    m_order.Order order;
    String token = await token_read();
    try {
      Response response = await apiService.dio.get(
        apiService.baseUrl + 'auth/order/completed',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );
      if (response.statusCode == 200) {
        order = m_order.Order.fromJson(response.data);
        listcourseCompleted = order.data;
        print(listcourseCompleted);
        return listcourseCompleted;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return listcourseCompleted;
  }
}
