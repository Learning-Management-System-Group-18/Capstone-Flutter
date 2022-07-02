import 'package:capstone_flutter/api/categories_repository.dart';
import 'package:capstone_flutter/api/content_repository.dart';
import 'package:capstone_flutter/api/course_repository.dart';
import 'package:capstone_flutter/api/mentor_repository.dart';
import 'package:capstone_flutter/api/section_repository.dart';
import 'package:capstone_flutter/api/tools_repository.dart';
import 'package:capstone_flutter/constants/state.dart';
import 'package:capstone_flutter/models/content_model.dart' as m_content;
import 'package:capstone_flutter/models/coursedetail_model.dart'
    as m_courseDetail;
import 'package:flutter/material.dart';
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

  DataState dataState = DataState.loading;

  var dataCategory = [];
  List get categories => dataCategory;

  void changeState(DataState state) {
    dataState = state;
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

  var dataCourse = [];
  List get courses => dataCourse;
  getDataAllCourse() async {
    try {
      var course = await _courseRepository.getAllCourse();
      dataCourse = course!;
      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  var detailCoure;
  m_courseDetail.Data? get dataDetailCourse => detailCoure;

  Future getDataCourseById({required int idCourse}) async {
    final detail = await _courseRepository.getCourseById(id: idCourse);
    detailCoure = detail;
    print('detail course : $detailCoure');
    notifyListeners();
  }

  var dataCourseByCategory = [];
  List get coursesCategory => dataCourseByCategory;
  getDataAllCourseByCategoryId({required int categoryId}) async {
    final courseCategory =
        await _courseRepository.getCourseByCategoryId(categoryId: categoryId);
    // print('cek null : $coursesCategory');
    dataCourseByCategory = courseCategory!;
    notifyListeners();
  }

  var dataMentor = [];
  List get mentorCourse => dataMentor;

  getAllMentorByCourseId({required int courseId}) async {
    final courseMentor =
        await _mentorRepository.getMentorByCourseId(courseId: courseId);
    dataMentor = courseMentor!;
    print('datamentor : $dataMentor');
    notifyListeners();
  }

  var dataTools = [];
  List get toolsCourse => dataTools;
  getAllToolByCourseId({required int courseId}) async {
    final courseTools =
        await _toolsRepository.getToolsByCourseId(courseId: courseId);
    dataTools = courseTools!;
    print('datamentor : $dataTools');
    notifyListeners();
  }

  var dataSection = [];
  List get sectionCourse => dataSection;

  getDataAllSectionByCourseId({required int courseId}) async {
    final courseSection =
        await _sectionRepository.getAllSectionByCourseId(courseId: courseId);
    dataSection = courseSection!;
    print('datasection : $dataSection');
    notifyListeners();
  }

  var dataContent;
  m_content.Data get dataAllContent => dataContent;

  Future<m_content.Data> getDataAllContentBySectionId(
      {required int? sectionId}) async {
    final contentSection = await _contentRepository.getAllContentBySectionId(
        sectionId: sectionId!);
    dataContent = contentSection;
    print('datacontent : $dataContent');
    return dataContent;
  }
}
