import 'package:capstone_flutter/api/service.dart';
import 'package:capstone_flutter/models/content_model.dart';
import 'package:capstone_flutter/models/quiz_model.dart' as m_quiz;
import 'package:capstone_flutter/models/slide_model.dart' as m_slide;
import 'package:capstone_flutter/models/video_model.dart' as m_video;

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContentRepository {
  final ApiService apiService = ApiService();
  Data? dataContent;
  m_video.Data? datavideo;
  m_slide.Data? dataslide;
  m_quiz.Data? dataquiz;

  token_read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final token = prefs.getString(key) ?? '';
    return token;
  }

  Future<Data?> getAllContentBySectionId({required int sectionId}) async {
    Content content;
    var parameter = {
      "sectionId": sectionId,
      "page": 1,
    };
    String? token = await token_read();
    try {
      Response response = await apiService.dio.get(
        apiService.baseUrl + 'content',
        queryParameters: parameter,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
      );
      if (response.statusCode == 200) {
        content = Content.fromJson(response.data);
        dataContent = content.data;
        return dataContent;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return dataContent;
  }

  Future<m_video.Data?> getDataVideoByIdVideo({
    required int id,
  }) async {
    m_video.ModelVideo video;
    var parameter = {
      "id": id,
    };
    String? token = await token_read();

    try {
      Response response = await apiService.dio.get(
        apiService.baseUrl + 'auth/video',
        queryParameters: parameter,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
      );
      if (response.statusCode == 200) {
        video = m_video.ModelVideo.fromJson(response.data);
        datavideo = video.data;
        return datavideo;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return datavideo;
  }

  Future<m_slide.Data?> getDataSlideByIdSlide({
    required int id,
  }) async {
    m_slide.ModelSlide slide;
    var parameter = {
      "id": id,
    };
    String? token = await token_read();

    try {
      Response response = await apiService.dio.get(
        apiService.baseUrl + 'auth/slide',
        queryParameters: parameter,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
      );
      if (response.statusCode == 200) {
        slide = m_slide.ModelSlide.fromJson(response.data);
        dataslide = slide.data;
        return dataslide;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return dataslide;
  }

  Future<m_quiz.Data?> getDataQuizbyIdQuiz({
    required int id,
  }) async {
    m_quiz.ModelQuiz quiz;
    var parameter = {
      "id": id,
    };
    String? token = await token_read();

    try {
      Response response = await apiService.dio.get(
        apiService.baseUrl + 'auth/quiz',
        queryParameters: parameter,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
      );
      if (response.statusCode == 200) {
        quiz = m_quiz.ModelQuiz.fromJson(response.data);
        dataquiz = quiz.data;
        return dataquiz;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return dataquiz;
  }
}
