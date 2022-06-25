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
          // "Authorization" : "Bearer $token",
        }),
        data: jsonEncode(params),
      );
      if (response.statusCode == 200) {
        responselogin = Responselogin.fromJson(response.data);
        return responselogin;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return responselogin;
  }

  // final pref = await SharedPreferences.getInstance();
  //     final token = pref.getString('token');

}
