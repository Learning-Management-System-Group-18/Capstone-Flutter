import 'package:capstone_flutter/api/categories_repository.dart';
import 'package:capstone_flutter/api/course_repository.dart';
import 'package:capstone_flutter/models/coursedetail_model.dart';
// import 'package:capstone_flutter/models/categories_model.dart' as m_categories;
// import 'package:capstone_flutter/models/course_model.dart' as m_course;
// import 'package:capstone_flutter/models/coursedetail_model.dart' as m_coursedetail;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends ChangeNotifier {
  var fullName;
  SharedPreferences? _pref;
  get fullname => fullName;
  final CategoriesRepository _categoriesController = CategoriesRepository();
  final CourseRepository _courseRepository = CourseRepository();

  var dataCategory = [];
  List get categories => dataCategory;

  getDataCategories() async {
    final category = await _categoriesController.getDataCategories();
    dataCategory = category!;
    print('data list category : $category');
    notifyListeners();
  }

  var dataCourse = [];
  List get courses => dataCourse;
  getDataAllCourse() async {
    final course = await _courseRepository.getAllCourse();
    dataCourse = course!;
    notifyListeners();
  }

  var detailCoure;
  Data? get dataDetailCourse => detailCoure;

  Future getDataCourseById({required int idCourse}) async {
    final detail = await _courseRepository.getCourseById(id: idCourse);
    detailCoure = detail;
    print('detail course : $detailCoure');
    notifyListeners();
  }
}
