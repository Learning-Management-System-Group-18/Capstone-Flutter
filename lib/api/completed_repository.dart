import 'package:capstone_flutter/api/response/response_completed_quiz.dart';
import 'package:capstone_flutter/api/response/response_completed_slide.dart';
import 'package:capstone_flutter/api/response/response_completed_video.dart';
import 'package:capstone_flutter/api/service.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompletedRepository {
  final ApiService apiService = ApiService();
  ResponseCompletedVideo? completedVideo;
  ResponseCompletedSlide? completedSlide;
  ResponseCompletedQuiz? completedQuiz;

  token_read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final token = prefs.getString(key) ?? '';
    return token;
  }

  Future<ResponseCompletedVideo?> PostCompletedVideo(int id) async {
    var parameter = {"id": id};
    String? token = await token_read();
    try {
      Response response = await apiService.dio.post(
        apiService.baseUrl + 'auth/video',
        queryParameters: parameter,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
      );
      if (response.statusCode == 200) {
        completedVideo = ResponseCompletedVideo.fromJson(response.data);
        return completedVideo;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return completedVideo;
  }

  Future<ResponseCompletedSlide?> PostCompletedSlide(int id) async {
    var parameter = {"id": id};
    String? token = await token_read();
    try {
      Response response = await apiService.dio.post(
        apiService.baseUrl + 'auth/slide',
        queryParameters: parameter,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
      );
      if (response.statusCode == 200) {
        completedSlide = ResponseCompletedSlide.fromJson(response.data);
        return completedSlide;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return completedSlide;
  }

  Future<ResponseCompletedQuiz?> PostCompletedQuiz(int id) async {
    var parameter = {"id": id};
    String? token = await token_read();
    try {
      Response response = await apiService.dio.post(
        apiService.baseUrl + 'auth/quiz',
        queryParameters: parameter,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
      );
      if (response.statusCode == 200) {
        completedQuiz = ResponseCompletedQuiz.fromJson(response.data);
        return completedQuiz;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return completedQuiz;
  }
}
