import 'package:cached_network_image/cached_network_image.dart';
import 'package:capstone_flutter/api/course_repository.dart';
import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/constants/icon.dart';
import 'package:capstone_flutter/constants/state.dart';
import 'package:capstone_flutter/controllers/HomeController.dart';
import 'package:capstone_flutter/widgets/alert.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/item_tabbar.dart';

class DetailCoursePage extends StatefulWidget {
  int id;
  DetailCoursePage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailCoursePage> createState() => _DetailCoursePageState();
}

class _DetailCoursePageState extends State<DetailCoursePage> {
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<HomeController>(context, listen: false)
            .getDataCourseById(idCourse: widget.id);
      });
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<HomeController>(context, listen: false)
            .getAllMentorByCourseId(courseId: widget.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    var deskripsi = homeController.dataDetailCourse?.description;
    var rating = homeController.dataDetailCourse?.rating;
    var title = homeController.dataDetailCourse?.title;

    if (homeController.dataState == DataState.loading) {
      return const Scaffold(
        body: Center(
          child: const CircularProgressIndicator(),
        ),
      );
    }
    if (homeController.dataState == DataState.error) {
      return Scaffold(
        body: Center(
          child: UrbanistText().blackBold('Something went wrong!', 14),
        ),
      );
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 200.0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: RepoIcon().whitearrowCircle,
            ),
            title: UrbanistText()
                .whiteBold('${homeController.dataDetailCourse?.title}', 20),
            backgroundColor: RepoColor().color1,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: CachedNetworkImage(
                width: 176,
                height: 121,
                imageUrl:
                    '${homeController.dataDetailCourse?.urlImage ?? 'https://img.freepik.com/free-vector/students-watching-recorded-lecture-with-professor-talking-from-tablet-podcast-courses-audio-video-recording-class-recording-access-concept-vector-isolated-illustration_335657-1983.jpg?w=2000'}',
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Image.network(
                    'https://img.freepik.com/free-vector/students-watching-recorded-lecture-with-professor-talking-from-tablet-podcast-courses-audio-video-recording-class-recording-access-concept-vector-isolated-illustration_335657-1983.jpg?w=2000'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: UrbanistText().blackBold(
                            '${homeController.dataDetailCourse?.title}', 24),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: RepoColor().color8,
                        margin: EdgeInsets.zero,
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 7.5, top: 5, right: 7.5, bottom: 5),
                          child: UrbanistText().primaryNormal(
                            '${homeController.dataDetailCourse?.level}',
                            12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  spaceHeight(5),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: RepoColor().color7),
                    ),
                    elevation: 0.0,
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 7.5, top: 5, right: 7.5, bottom: 5),
                      child: UrbanistText().blackNormal(
                        'Category ${homeController.dataDetailCourse?.category?.title}',
                        14,
                      ),
                    ),
                  ),
                  spaceHeight(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              RepoIcon().star,
                              spaceWidth(8),
                              UrbanistText().blackNormal(
                                  '${(homeController.dataDetailCourse?.rating)?.toStringAsFixed(1)} Reviews',
                                  16),
                            ],
                          ),
                          spaceHeight(10),
                          Row(
                            children: [
                              RepoIcon().userPrimary,
                              spaceWidth(8),
                              UrbanistText().blackNormal(
                                  '${homeController.dataDetailCourse?.countUser} employees',
                                  16),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              RepoIcon().filetext1,
                              spaceWidth(8),
                              UrbanistText().blackNormal('Certificate', 16),
                            ],
                          ),
                          spaceHeight(10),
                          Row(
                            children: [
                              RepoIcon().clock1,
                              spaceWidth(8),
                              UrbanistText().blackNormal('Flexible', 16),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  spaceHeight(20),
                  const Divider(
                    height: 5,
                  ),
                  _tabSection(
                    context,
                    widget.id,
                    deskripsi,
                    rating,
                    title,
                  ),
                  spaceHeight(10),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white),
        child: ElevatedButton(
          onPressed: () {
            homeController.createOrderCourse(
              context,
              widget.id,
              title!,
            );
          },
          child: UrbanistText().whiteBold("Enroll Courses", 16),
          style: ElevatedButton.styleFrom(
            elevation: 10,
            primary: RepoColor().color1,
            minimumSize: const Size.fromHeight(56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _tabSection(BuildContext context, int courseId, String? deskripsi,
    double? rating, String? title) {
  return DefaultTabController(
    length: 3,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: TabBar(
              unselectedLabelColor: Colors.grey,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: RepoColor().color1,
                    width: 4.0,
                  ),
                  insets: const EdgeInsets.symmetric(horizontal: 10.0)),
              tabs: const [
                Tab(
                  child: Text(
                    'About',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    'Lessons',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    'Reviews',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ]),
        ),
        Container(
          color: Colors.white,
          height: 358,
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ItemAboutTabBar(courseId: courseId, deskripsi: deskripsi),
              ItemSectionTabBar(courseId: courseId, title: title),
              ItemReviewTabBar(
                  courseId: courseId, rating: rating, title: title),
            ],
          ),
        ),
      ],
    ),
  );
}
