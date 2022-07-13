import 'package:capstone_flutter/screens/onboarding/loginscreen.dart';
import 'package:capstone_flutter/screens/onboarding/splashscreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio dio = Dio();
  final baseUrl = 'http://54.227.80.34/api/';

  // ApiService() {
  //   dio.interceptors.add(
  //     InterceptorsWrapper(onError: (DioError e, handler) async {
  //       SharedPreferences preferences = await SharedPreferences.getInstance();
  //       if (e.response?.statusCode == 403) {
  //         // preferences.setBool("is_login", false);
  //         // preferences.remove("email");
  //         // preferences.remove("fullName");
  //         // preferences.remove("token");
  //         print('error : ${e.response?.statusCode}');
  //       }
  //     }),
  //   );
  // }
}
