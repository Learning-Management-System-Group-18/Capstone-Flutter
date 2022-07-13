import 'dart:convert';
import 'dart:io';

import 'package:capstone_flutter/api/service.dart';
import 'package:capstone_flutter/models/user_model.dart' as m_user;
import 'package:capstone_flutter/models/user_update_model.dart'
    as m_user_update;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final ApiService apiService = ApiService();
  m_user.Data? datauser;
  m_user_update.UserUpdate? dataupdateUser;
  m_user_update.UserUpdate? dataupdateImage;

  token_read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final token = prefs.getString(key) ?? '';
    return token;
  }

  Future<m_user.Data?> getDataUser() async {
    m_user.UserData userData;
    try {
      String token = await token_read();
      Response response = await apiService.dio.get(
        apiService.baseUrl + 'auth/profile',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            "Authorization": "Bearer ${token}",
          },
        ),
      );
      if (response.statusCode == 200) {
        userData = m_user.UserData.fromJson(response.data);
        datauser = userData.data;
        return datauser;
      }
    } on DioError catch (e) {
      print(e.response?.statusCode);
    }
    return datauser;
  }

  Future<m_user_update.UserUpdate?> updateDataUser(
      String phone, String birth, String gender, String address) async {
    String token = await token_read();
    var body = {
      "phone_number": phone,
      "date_of_birth": birth,
      "role": "ROLE_USER",
      "status": "_",
      "gender": gender,
      "address": address,
    };
    try {
      print(token);
      Response response = await apiService.dio.put(
        apiService.baseUrl + 'auth/profile',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: jsonEncode(body),
      );
      print('response : ${response.statusCode}');
      if (response.statusCode == 200) {
        dataupdateUser = m_user_update.UserUpdate.fromJson(response.data);
        return dataupdateUser;
      }
    } on DioError catch (e) {
      print(e);
    }
    return dataupdateUser;
  }

  Future<m_user_update.UserUpdate?> updateDataUserWithImage(String phone,
      String birth, String gender, String address, String? image) async {
    String token = await token_read();
    var body = {
      "phone_number": phone,
      "date_of_birth": birth,
      "role": "ROLE_USER",
      "status": "_",
      "gender": gender,
      "address": address,
      "url_image": image,
    };
    try {
      print(token);
      Response response = await apiService.dio.put(
        apiService.baseUrl + 'auth/profile',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: jsonEncode(body),
      );
      print('response : ${response.statusCode}');
      if (response.statusCode == 200) {
        dataupdateUser = m_user_update.UserUpdate.fromJson(response.data);
        return dataupdateUser;
      }
    } on DioError catch (e) {
      print(e);
    }
    return dataupdateUser;
  }

  Future<m_user_update.UserUpdate?> updateImageUser(final File file) async {
    String token = await token_read();
    try {
      print(token);
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(file.path, filename: fileName)
      });

      Response response = await apiService.dio.put(
        apiService.baseUrl + 'auth/profile/image',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: formData,
      );
      print('response : ${response.statusCode}');
      if (response.statusCode == 200) {
        dataupdateImage = m_user_update.UserUpdate.fromJson(response.data);
        return dataupdateImage;
      }
    } on DioError catch (e) {
      print(e);
    }
    return dataupdateImage;
  }
}
