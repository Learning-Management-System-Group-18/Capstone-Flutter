import 'package:capstone_flutter/api/completed_repository.dart';
import 'package:capstone_flutter/api/content_repository.dart';
import 'package:capstone_flutter/api/order_repository.dart';
import 'package:capstone_flutter/api/review_repository.dart';
import 'package:capstone_flutter/api/section_repository.dart';
import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/constants/state.dart';
import 'package:capstone_flutter/models/content_model.dart' as m_content;
import 'package:capstone_flutter/models/order_model.dart' as m_order;
import 'package:capstone_flutter/models/quiz_model.dart' as m_quiz;
import 'package:capstone_flutter/models/slide_model.dart' as m_slide;
import 'package:capstone_flutter/models/video_model.dart' as m_video;
import 'package:capstone_flutter/widgets/alert.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseController extends ChangeNotifier {
  final OrderRepository _orderRepository = OrderRepository();
  final SectionRepository _sectionRepository = SectionRepository();
  final ContentRepository _contentRepository = ContentRepository();
  final CompletedRepository _completedRepository = CompletedRepository();
  final ReviewRepository _reviewRepository = ReviewRepository();

  DataState dataState = DataState.loading;

  Color defaultLessonColor = RepoColor().color1;

  List<m_order.Data> dataCourseOnGoing = [];
  List<m_order.Data> get CourseOnGoing => dataCourseOnGoing;

  List<m_order.Data> dataCourseCompleted = [];
  List<m_order.Data> get CourseCompleted => dataCourseCompleted;

  var dataSection = [];
  List get sectionCourse => dataSection;

  m_content.Data? dataContent;
  m_content.Data get dataAllContent => dataContent!;

  m_video.Data? dataVideo;
  m_video.Data get lessonVideo => dataVideo!;

  m_slide.Data? dataSlide;
  m_slide.Data get lessonSlide => dataSlide!;

  m_quiz.Data? dataQuiz;
  m_quiz.Data get lessonQuiz => dataQuiz!;

  void changeColor(Color color) {
    defaultLessonColor = color;
    notifyListeners();
  }

  void changeState(DataState state) {
    dataState = state;
    notifyListeners();
  }

  fullName_read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'fullName';
    final fullName = prefs.getString(key) ?? '';
    return fullName;
  }

  getDataAllCourseOnGoing() async {
    changeState(DataState.loading);
    try {
      var enrolcourse = await _orderRepository.getAllCourseOnGoing();
      dataCourseOnGoing = enrolcourse!;
      print('datacourseongoing : ${dataCourseOnGoing}');
      changeState(DataState.filled);
    } catch (e) {
      print(e);
      changeState(DataState.error);
    }
  }

  getDataAllCourseCompleted() async {
    changeState(DataState.loading);
    try {
      var completedcourse = await _orderRepository.getAllCourseCompleted();
      dataCourseCompleted = completedcourse!;
      print('course complete : $dataCourseCompleted');
      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  getDataSectionCourseOrder({required int courseId}) async {
    changeState(DataState.loading);
    try {
      final courseSection =
          await _sectionRepository.getAllSectionByCourseId(courseId: courseId);
      dataSection = courseSection!;
      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  Future<m_content.Data> getDataAllContentBySectionId(
      {required int? sectionId}) async {
    final contentSection = await _contentRepository.getAllContentBySectionId(
        sectionId: sectionId!);
    dataContent = contentSection;
    return dataContent!;
  }

  getDataVideoByIdVideo({required int videoId}) async {
    final videoSection =
        await _contentRepository.getDataVideoByIdVideo(id: videoId);
    dataVideo = videoSection;
    notifyListeners();
  }

  getDataSlideByIdSlide({required int slideId}) async {
    final slideSection =
        await _contentRepository.getDataSlideByIdSlide(id: slideId);
    dataSlide = slideSection;
    notifyListeners();
  }

  getDataQuizByIdQuiz({required int quizId}) async {
    final quizSection =
        await _contentRepository.getDataQuizbyIdQuiz(id: quizId);
    dataQuiz = quizSection;
    notifyListeners();
  }

  completedVideo(BuildContext context, int id) async {
    final videoCompleted = await _completedRepository.PostCompletedVideo(id);
    if (videoCompleted?.status?.code == "SUCCESS") {
      AlertSucces(context, '${videoCompleted?.data}');
    } else {
      AlertError(context, 'You already to completed this lesson!');
    }
  }

  completedSlide(BuildContext context, int id) async {
    final slideCompleted = await _completedRepository.PostCompletedSlide(id);
    if (slideCompleted?.status?.code == "SUCCESS") {
      AlertSucces(context, '${slideCompleted?.data}');
    } else {
      AlertError(context, 'You already to completed this lesson!');
    }
  }

  completedQuiz(BuildContext context, int id) async {
    final quizCompleted = await _completedRepository.PostCompletedQuiz(id);
    if (quizCompleted?.status?.code == "SUCCESS") {
      AlertSucces(context, '${quizCompleted?.data}');
    } else {
      AlertError(context, 'You already to completed this lesson!');
    }
  }

  reviewCourse(
      BuildContext context, int id, double? rating, String review) async {
    int rate = rating!.toInt();
    print('rate : $rate');
    if (review.isEmpty) {
      AlertError(context, 'Review cannot be empty!');
    } else if (review.length < 5) {
      AlertInfo(context, 'Review min 5 character!');
    } else {
      final courseReview =
          await _reviewRepository.PostReviewCourse(id, rate, review);
      print('review : $courseReview');
      if (courseReview?.status?.code == "SUCCESS") {
        AlertSucces(context, 'Your review was successfully created!');
      } else {
        AlertError(context, 'Oops, You can just only make one review!');
      }
    }
  }
}
