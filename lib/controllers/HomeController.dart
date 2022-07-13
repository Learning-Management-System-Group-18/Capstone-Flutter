import 'package:capstone_flutter/api/categories_repository.dart';
import 'package:capstone_flutter/api/content_repository.dart';
import 'package:capstone_flutter/api/course_repository.dart';
import 'package:capstone_flutter/api/mentor_repository.dart';
import 'package:capstone_flutter/api/order_repository.dart';
import 'package:capstone_flutter/api/review_repository.dart';
import 'package:capstone_flutter/api/section_repository.dart';
import 'package:capstone_flutter/api/tools_repository.dart';
import 'package:capstone_flutter/api/user_repository.dart';
import 'package:capstone_flutter/constants/state.dart';
import 'package:capstone_flutter/models/content_model.dart' as m_content;
import 'package:capstone_flutter/models/reviews_model.dart' as m_review;
import 'package:capstone_flutter/models/coursedetail_model.dart'
    as m_courseDetail;
import 'package:capstone_flutter/models/user_model.dart' as m_user;

import 'package:capstone_flutter/screens/course/course_ongoing_page.dart';
import 'package:capstone_flutter/widgets/alert.dart';
import 'package:capstone_flutter/widgets/transition.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends ChangeNotifier {
  var fullName;
  SharedPreferences? _pref;
  get fullname => fullName;
  final CategoriesRepository _categoriesController = CategoriesRepository();
  final CourseRepository _courseRepository = CourseRepository();
  final MentorRepository _mentorRepository = MentorRepository();
  final ToolsRepository _toolsRepository = ToolsRepository();
  final SectionRepository _sectionRepository = SectionRepository();
  final ContentRepository _contentRepository = ContentRepository();
  final ReviewRepository _reviewRepository = ReviewRepository();
  final OrderRepository _orderRepository = OrderRepository();
  final UserRepository _userRepository = UserRepository();

  DataState dataState = DataState.loading;

  var dataCategory = [];
  var dataCourse = [];
  var dataCoursePopular = [];
  var detailCourse;
  var dataCourseByCategory = [];
  var dataMentor = [];
  var dataTools = [];
  var dataSection = [];
  var dataContent;
  List<m_review.Data> dataReview = [];

  var datauser;

  List get categories => dataCategory;
  List get courses => dataCourse;
  List get coursesPopular => dataCourse;
  m_courseDetail.Data? get dataDetailCourse => detailCourse;
  m_user.Data? get dataProfileUser => datauser;
  List get coursesCategory => dataCourseByCategory;
  List get mentorCourse => dataMentor;
  List get toolsCourse => dataTools;
  List get sectionCourse => dataSection;
  m_content.Data get dataAllContent => dataContent;
  List get reviewCourse => dataReview;

  String? token;

  void changeState(DataState state) {
    dataState = state;
    notifyListeners();
  }

  token_read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    token = prefs.getString(key) ?? '';
    return token;
  }

  getAllDataUser() async {
    final userdata = await _userRepository.getDataUser();
    datauser = userdata;
    notifyListeners();
  }

  getDataCategories() async {
    changeState(DataState.loading);
    try {
      var category = await _categoriesController.getDataCategories();
      dataCategory = category!;
      print('data list category : $category');
      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  getDataAllCourse() async {
    changeState(DataState.loading);
    try {
      var course = await _courseRepository.getAllCourse();
      dataCourse = course!;
      print('datacourse : ${dataCourse}');
      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  getDataAllCoursePopular() async {
    changeState(DataState.loading);
    try {
      var course = await _courseRepository.getCoursePopular();
      dataCoursePopular = course!;
      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  getDataCourseById({required int idCourse}) async {
    changeState(DataState.loading);
    try {
      final detail = await _courseRepository.getCourseById(id: idCourse);
      detailCourse = detail;
      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  getDataAllCourseByCategoryId({required int categoryId}) async {
    changeState(DataState.loading);
    try {
      final courseCategory =
          await _courseRepository.getCourseByCategoryId(categoryId: categoryId);
      // print('cek null : $coursesCategory');
      dataCourseByCategory = courseCategory!;
      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  getAllMentorByCourseId({required int courseId}) async {
    final courseMentor =
        await _mentorRepository.getMentorByCourseId(courseId: courseId);
    dataMentor = courseMentor!;
    print('datamentor : $dataMentor');
    notifyListeners();
  }

  getAllToolByCourseId({required int courseId}) async {
    final courseTools =
        await _toolsRepository.getToolsByCourseId(courseId: courseId);
    dataTools = courseTools!;
    print('datamentor : $dataTools');
    notifyListeners();
  }

  getDataAllSectionByCourseId({required int courseId}) async {
    final courseSection =
        await _sectionRepository.getAllSectionByCourseId(courseId: courseId);
    dataSection = courseSection!;
    notifyListeners();
  }

  Future<m_content.Data> getDataAllContentBySectionId(
      {required int? sectionId}) async {
    final contentSection = await _contentRepository.getAllContentBySectionId(
        sectionId: sectionId!);
    dataContent = contentSection;
    notifyListeners();
    return dataContent;
  }

  Future<List<m_review.Data>> getDataAllReviewByCourseId(
      {required int courseId}) async {
    final review =
        await _reviewRepository.getAllReviewByCourseId(courseId: courseId);
    dataReview = review!;
    return dataReview;
  }

  Future<List<m_review.Data>> getDataAllReviewByCourseIdByRating(
      {required int courseId, int? rating}) async {
    final review = await _reviewRepository.getAllReviewByCourseIdByRating(
        courseId: courseId, rating: rating);
    dataReview = review!;
    return dataReview;
  }

  createOrderCourse(BuildContext context, int courseId, String title) async {
    final order = await _orderRepository.orderCourse(courseId: courseId);
    if (token_read() == null) {
      AlertError(context, '${order?.status?.message}');
    } else if (order?.status?.code == "UNKNOWN_ERROR") {
      AlertError(context, 'You have enrolled in this course!');
    } else if (order?.status?.code == "SUCCESS") {
      EnrollSucces(context, 'You have successfully enrolled the course!', () {
        Navigator.push(
          context,
          TransisiHalaman(
            tipe: PageTransitionType.rightToLeftWithFade,
            page: CourseOnGoingPage(
              courseId: courseId,
              title: title,
            ),
          ),
        );
      });
    }
  }
}
