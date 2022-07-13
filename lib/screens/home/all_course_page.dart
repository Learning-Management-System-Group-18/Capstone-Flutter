import 'package:capstone_flutter/api/course_repository.dart';
import 'package:capstone_flutter/controllers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/icon.dart';
import '../../models/course_model.dart' as m_course;
import '../../widgets/item_listview.dart';
import '../../widgets/text.dart';

class AllCoursePage extends StatefulWidget {
  const AllCoursePage({Key? key}) : super(key: key);

  @override
  State<AllCoursePage> createState() => _AllCoursePageState();
}

class _AllCoursePageState extends State<AllCoursePage> {
  bool _searchBoolean = false;
  String? value;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false).getDataAllCourse();
    });
  }

  Widget _searchTextField() {
    return TextField(
      onChanged: (String s) {
        setState(() {
          value = s;
        });
      },
      autofocus: true,
      cursorColor: const Color.fromRGBO(51, 94, 247, 3),
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontFamily: 'Urbanist'),
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(51, 94, 247, 3))),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(51, 94, 247, 3))),
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _searchListView(String? value) {
    print('value : $value');
    return FutureBuilder<List<m_course.Data>?>(
      future: CourseRepository().postSearchCourse(value),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final data = snapshot.data?[index];
                return ItemAllCourse(data: data!);
              },
            );
          } else {
            return Center(
              child: UrbanistText().blackNormal('Data not found!', 14),
            );
          }
        } else {
          return Center(
            child: UrbanistText().blackNormal('Plese wait...', 14),
          );
        }
      },
    );
  }

  Widget _defaultListView(HomeController homeController) {
    // var size = MediaQuery.of(context).size;

    // /*24 is for notification bar on Android*/
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = size.width / 2;

    return ListView.builder(
      itemCount: homeController.courses.length,
      itemBuilder: (context, index) {
        final course = homeController.courses[index];
        return ItemAllCourse(data: course);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: RepoIcon().arrowCircle,
        ),
        elevation: 0.0,
        title: !_searchBoolean
            ? UrbanistText().blackBold('All Courses', 20)
            : _searchTextField(),
        actions: !_searchBoolean
            ? [
                IconButton(
                  icon: RepoIcon().search,
                  onPressed: () {
                    setState(
                      () {
                        _searchBoolean = true;
                      },
                    );
                  },
                ),
              ]
            : [
                IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Color.fromRGBO(51, 94, 247, 3),
                  ),
                  onPressed: () {
                    setState(
                      () {
                        _searchBoolean = false;
                      },
                    );
                  },
                )
              ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: !_searchBoolean
                  ? _defaultListView(homeController)
                  : _searchListView(value),
            ),
          ],
        ),
      ),
    );
  }
}
