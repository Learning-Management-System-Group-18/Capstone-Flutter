import 'dart:convert';
import 'dart:io';

// import 'package:dio/dio.dart';
import 'package:capstone_flutter/api/response/response_login.dart';
import 'package:capstone_flutter/api/response/response_register.dart';
import 'package:capstone_flutter/api/service.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final ApiService apiService = ApiService();
  Responselogin? responselogin;
  ResponseRegister? responseRegister;

  Future<ResponseRegister?> userRegister(
      String nama, String email, String password) async {
    var params = {"fullName": nama, "email": email, "password": password};
    try {
      Response response = await apiService.dio.post(
        apiService.baseUrl + 'register',
        data: jsonEncode(params),
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        responseRegister = ResponseRegister.fromJson(response.data);
        return responseRegister;
      }
    } on DioError catch (e) {
      print('error : ${e.response!.statusCode}');
    }
    return responseRegister;
  }

  Future<Responselogin?> userLogin(String email, String password) async {
    print('email : $email');
    print('password : $password');
    var params = {"email": email, "password": password};
    try {
      Response response = await apiService.dio.post(
        apiService.baseUrl + 'login',
        data: jsonEncode(params),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          // "Authorization" : "Bearer $token",
        }),
      );
      print('response : $response');
      if (response.statusCode == 200) {
        responselogin = Responselogin.fromJson(response.data);
        print(responselogin);
        return responselogin;
      }
    } on DioError catch (e) {
      print('error : ${e.response!.statusCode}');
    }
    return responselogin;
  }

  // final pref = await SharedPreferences.getInstance();
  //     final token = pref.getString('token');

}
