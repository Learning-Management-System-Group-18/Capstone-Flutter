import 'dart:convert';
import 'dart:io';

// import 'package:dio/dio.dart';
import 'package:capstone_flutter/api/response/response_login.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final Dio _dio = Dio();
  final _baseUrl = 'http://54.227.80.34/api/';
  Responselogin? responselogin;

  userRegister(String nama, String email, String password) async {
    var params = {"fullName": nama, "email": email, "password": password};
    Response response = await _dio.post(
      _baseUrl + 'register',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(params),
    );
  }

  Future<Responselogin?> userLogin(String email, String password) async {
    var params = {"email": email, "password": password};
    try {
      Response response = await _dio.post(
        _baseUrl + 'login',
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

  // Future<User> authLogin(
  //     {required String email, required String password}) async {
  //   var data = {
  //     "email": email,
  //     "password": password,
  //   };
  //   try {
  //     Response response =
  //         await _dio.get(_baseUrl + "login", queryParameters: data);
  //     return User.fromJson(response.data[0]);
  //   } catch (e) {
  //     return User.fromJson({});
  //   }
  // }

  // userRegister(String fullname, String email, String password) {
  //   http.post(
  //     Uri.parse('http://54.227.80.34/api/register'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       "fullName": fullname,
  //       "email": email,
  //       "password": password,
  //     }),
  //   );
  // }

  // userLogin(String email, String password) {
  //   http.post(
  //     Uri.parse('http://54.227.80.34/api/login'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       "email": email,
  //       "password": password,
  //     }),
  //   );
  // }
}
