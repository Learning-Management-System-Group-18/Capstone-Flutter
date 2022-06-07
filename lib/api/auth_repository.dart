import 'dart:convert';
import 'dart:io';

// import 'package:dio/dio.dart';
import 'package:capstone_flutter/api/response/response_login.dart';
import 'package:capstone_flutter/api/service.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final ApiService apiService = ApiService();
  Responselogin? responselogin;

  userRegister(String nama, String email, String password) async {
    var params = {"fullName": nama, "email": email, "password": password};
    Response response = await apiService.dio.post(
      apiService.baseUrl + 'register',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(params),
    );
  }

  Future<Responselogin?> userLogin(String email, String password) async {
    var params = {"email": email, "password": password};
    try {
      Response response = await apiService.dio.post(
        apiService.baseUrl + 'login',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(params),
      );
      responselogin = Responselogin.fromJson(response.data);
      print(responselogin);
    } catch (e) {
      print(e);
    }
    return responselogin;
  }
}
