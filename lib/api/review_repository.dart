import 'package:capstone_flutter/api/response/response_review.dart'
    as m_res_review;
import 'package:capstone_flutter/api/service.dart';
import 'package:capstone_flutter/models/reviews_model.dart' as m_review;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewRepository {
  final ApiService apiService = ApiService();
  List<m_review.Data>? listreview;
  m_res_review.ResponseReview? responseReview;

  token_read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final token = prefs.getString(key) ?? '';
    return token;
  }

  Future<List<m_review.Data>?> getAllReviewByCourseId(
      {required int courseId}) async {
    m_review.Review review;

    var parameter = {
      "courseId": courseId,
      "page": 0,
      "size": 10,
    };
    try {
      Response response = await apiService.dio
          .get(apiService.baseUrl + 'review', queryParameters: parameter);
      if (response.statusCode == 200) {
        review = m_review.Review.fromJson(response.data);
        listreview = review.data;
        return listreview;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return listreview;
  }

  Future<List<m_review.Data>?> getAllReviewByCourseIdByRating(
      {required int courseId, int? rating}) async {
    m_review.Review review;

    var parameter = {
      "courseId": courseId,
      "rating": rating,
      "page": 0,
      "size": 10,
    };
    try {
      Response response = await apiService.dio
          .get(apiService.baseUrl + 'review', queryParameters: parameter);
      if (response.statusCode == 200) {
        review = m_review.Review.fromJson(response.data);
        listreview = review.data;
        return listreview;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return listreview;
  }

  Future<m_res_review.ResponseReview?> PostReviewCourse(
      int id, int rating, String review) async {
    var parameter = {"courseId": id};
    var data = {"rating": rating, "review": review};
    String? token = await token_read();
    try {
      Response response =
          await apiService.dio.post(apiService.baseUrl + 'auth/review',
              queryParameters: parameter,
              options: Options(headers: {
                "Authorization": "Bearer $token",
              }),
              data: data);
      if (response.statusCode == 200) {
        responseReview = m_res_review.ResponseReview.fromJson(response.data);
        return responseReview;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      }
    }
    return responseReview;
  }
}
