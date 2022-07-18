import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/constants/icon.dart';
import 'package:capstone_flutter/constants/state.dart';
import 'package:capstone_flutter/controllers/CourseController.dart';
import 'package:capstone_flutter/controllers/HomeController.dart';
import 'package:capstone_flutter/models/content_model.dart' as m_content;
import 'package:capstone_flutter/models/mentor_model.dart' as m_mentor;
import 'package:capstone_flutter/models/reviews_model.dart' as m_review;
import 'package:capstone_flutter/models/section_model.dart' as m_section;
import 'package:capstone_flutter/models/tools_model.dart' as m_tool;
import 'package:capstone_flutter/screens/home/all_course_page.dart';
import 'package:capstone_flutter/screens/home/all_lesson_page.dart';
import 'package:capstone_flutter/screens/home/all_review_page.dart';
import 'package:capstone_flutter/widgets/item_listview.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:capstone_flutter/widgets/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemAboutTabBar extends StatefulWidget {
  int courseId;
  String? deskripsi;
  ItemAboutTabBar({Key? key, required this.courseId, required this.deskripsi})
      : super(key: key);

  @override
  State<ItemAboutTabBar> createState() => _ItemAboutTabBarState();
}

class _ItemAboutTabBarState extends State<ItemAboutTabBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<HomeController>(context, listen: false)
            .getAllMentorByCourseId(courseId: widget.courseId);
      });
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<HomeController>(context, listen: false)
            .getAllToolByCourseId(courseId: widget.courseId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          spaceHeight(15),
          UrbanistText().blackBold('Mentor', 18),
          spaceHeight(10),
          ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: homeController.mentorCourse.length,
              itemBuilder: (context, index) {
                m_mentor.Data mentor = homeController.mentorCourse[index];
                return Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            NetworkImage(mentor.urlImage.toString()),
                        radius: 20,
                      ),
                      spaceWidth(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UrbanistText().blackBold('${mentor.name}', 16),
                          UrbanistText().blackNormal('Senoir of ', 16),
                        ],
                      ),
                    ],
                  ),
                );
              }),
          spaceHeight(20),
          UrbanistText().blackBold('About Course', 18),
          spaceHeight(10),
          UrbanistText().blackNormal('${widget.deskripsi}', 16),
          spaceHeight(20),
          UrbanistText().blackBold('Tools', 18),
          spaceHeight(10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: homeController.toolsCourse.length,
            itemBuilder: (context, index) {
              m_tool.Data tool = homeController.toolsCourse[index];
              return Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 200,
                  child: ItemTools(
                    tool: tool,
                  ),
                ),
              );
            },
          ),
          spaceHeight(50),
        ],
      ),
    );
  }
}

class ItemSectionTabBar extends StatefulWidget {
  int courseId;
  String? title;
  ItemSectionTabBar({Key? key, required this.courseId, required this.title})
      : super(key: key);

  @override
  State<ItemSectionTabBar> createState() => _ItemSectionTabBarState();
}

class _ItemSectionTabBarState extends State<ItemSectionTabBar> {
  @override
  void initState() {
    super.initState();
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<HomeController>(context, listen: false)
            .getDataAllSectionByCourseId(courseId: widget.courseId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          spaceHeight(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UrbanistText().blackBold(
                  '${homeController.sectionCourse.length} Section', 18),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    TransisiHalaman(
                      tipe: PageTransitionType.leftToRight,
                      page: AllLessonPage(
                          courseId: widget.courseId, title: widget.title),
                    ),
                  );
                },
                child: UrbanistText().blackBold('See All', 18),
              ),
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: homeController.sectionCourse.length,
            itemBuilder: (context, index) {
              m_section.Data section = homeController.sectionCourse[index];
              int? idSection = section.id;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spaceHeight(20),
                  UrbanistText()
                      .blackBold('${index + 1} - ${section.title}', 18),
                  spaceHeight(10),
                  FutureBuilder<m_content.Data>(
                    future: homeController.getDataAllContentBySectionId(
                        sectionId: idSection),
                    builder: (context, AsyncSnapshot<m_content.Data> snapshot) {
                      List lesson = [];
                      if (snapshot.hasData) {
                        final video = snapshot.data?.video;
                        final slide = snapshot.data?.slide;
                        final quiz = snapshot.data?.quiz;
                        for (var vid in video!) {
                          lesson.add(vid);
                        }
                        for (var sld in slide!) {
                          lesson.add(sld);
                        }
                        for (var quiz2 in quiz!) {
                          lesson.add(quiz2);
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: lesson.length,
                          itemBuilder: (context, indexLesson) {
                            final dataLesson = lesson[indexLesson];
                            return ItemLessonLock(
                              data: dataLesson,
                              idx: indexLesson,
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: UrbanistText()
                              .primaryNormal('Please wait...', 14),
                        );
                      }
                    },
                  ),
                ],
              );
            },
          ),
          spaceHeight(30),
        ],
      ),
    );
  }
}

class ItemReviewTabBar extends StatefulWidget {
  int courseId;
  double? rating;
  String? title;
  ItemReviewTabBar(
      {Key? key,
      required this.courseId,
      required this.rating,
      required this.title})
      : super(key: key);

  @override
  State<ItemReviewTabBar> createState() => _ItemReviewTabBarState();
}

class _ItemReviewTabBarState extends State<ItemReviewTabBar> {
  int? ratechoice;
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    print('ratecoise : $ratechoice');
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          spaceHeight(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  RepoIcon().star,
                  spaceWidth(8),
                  UrbanistText().blackBold(
                      '${(widget.rating)?.toStringAsFixed(1)} Reviews', 18),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    TransisiHalaman(
                      tipe: PageTransitionType.leftToRight,
                      page: AllReviewPage(
                          courseId: widget.courseId,
                          rating: widget.rating,
                          title: widget.title),
                    ),
                  );
                },
                child: UrbanistText().blackBold('See All', 18),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(width: 1.0, color: RepoColor().color1),
                    ),
                    elevation: 0.0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ratechoice = 0;
                        });
                      },
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RepoIcon().star,
                              spaceWidth(3),
                              UrbanistText().blackNormal('All', 16)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(width: 1.0, color: RepoColor().color1),
                    ),
                    elevation: 0.0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ratechoice = 1;
                        });
                      },
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RepoIcon().star,
                              spaceWidth(3),
                              UrbanistText().blackNormal('1', 16)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(width: 1.0, color: RepoColor().color1),
                    ),
                    elevation: 0.0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ratechoice = 2;
                        });
                      },
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RepoIcon().star,
                              spaceWidth(3),
                              UrbanistText().blackNormal('2', 16)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(width: 1.0, color: RepoColor().color1),
                    ),
                    elevation: 0.0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ratechoice = 3;
                        });
                      },
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RepoIcon().star,
                              spaceWidth(3),
                              UrbanistText().blackNormal('3', 16)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(width: 1.0, color: RepoColor().color1),
                    ),
                    elevation: 0.0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ratechoice = 4;
                        });
                      },
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RepoIcon().star,
                              spaceWidth(3),
                              UrbanistText().blackNormal('4', 16)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(width: 1.0, color: RepoColor().color1),
                    ),
                    elevation: 0.0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ratechoice = 5;
                        });
                      },
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RepoIcon().star,
                              spaceWidth(3),
                              UrbanistText().blackNormal('5', 16)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // GroupButton(
          //   buttons: const [
          //     'All',
          //     '1',
          //     '2',
          //     '3',
          //     '4',
          //     '5',
          //   ],
          //   controller: GroupButtonController(selectedIndex: 4),
          //   options: GroupButtonOptions(
          //     selectedShadow: const [],
          //     unselectedShadow: const [],
          //     unselectedColor: Colors.grey[300],
          //     unselectedTextStyle: TextStyle(
          //       color: Colors.grey[600],
          //     ),
          //     borderRadius: BorderRadius.circular(30),
          //   ),
          //   onSelected: (val, i, selected) =>
          //       debugPrint('Button: $val index: $i $selected'),
          // ),
          spaceHeight(10),
          if (ratechoice == 0 || ratechoice == null) ...[
            FutureBuilder<List<m_review.Data>>(
              future: homeController.getDataAllReviewByCourseId(
                  courseId: widget.courseId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        final review = snapshot.data?[index];
                        return ItemReview(
                          dataReview: review!,
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: UrbanistText().blackNormal('Nothing', 13),
                    );
                  }
                } else {
                  return Center(
                    child: UrbanistText().blackBold('Please wait...', 13),
                  );
                }
              },
            ),
          ] else ...[
            FutureBuilder<List<m_review.Data>>(
              future: homeController.getDataAllReviewByCourseIdByRating(
                  courseId: widget.courseId, rating: ratechoice),
              builder: (context, snapshot) {
                print('snaphshot re : $snapshot');
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        final review = snapshot.data?[index];
                        return ItemReview(
                          dataReview: review!,
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: UrbanistText().blackNormal('Nothing', 13),
                    );
                  }
                } else {
                  return Center(
                    child: UrbanistText().blackBold('Please wait...', 13),
                  );
                }
              },
            ),
          ],
          spaceHeight(20),
        ],
      ),
    );
  }
}

class ItemOnGoingTabBar extends StatefulWidget {
  const ItemOnGoingTabBar({Key? key}) : super(key: key);

  @override
  State<ItemOnGoingTabBar> createState() => _ItemOnGoingTabBarState();
}

class _ItemOnGoingTabBarState extends State<ItemOnGoingTabBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<CourseController>(context, listen: false)
            .getDataAllCourseOnGoing();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final courseController = Provider.of<CourseController>(context);

    if (courseController.dataState == DataState.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (courseController.dataState == DataState.error) {
      return Center(
        child: UrbanistText().blackNormal('Something went wrong!', 14),
      );
    }
    return RefreshIndicator(
      onRefresh: () async {
        Provider.of<CourseController>(context, listen: false)
            .getDataAllCourseCompleted();
      },
      child: courseController.dataCourseOnGoing.isEmpty
          ? Center(
              child: Column(
                children: [
                  Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: Svg('assets/images/search.svg'),
                      ),
                    ),
                  ),
                  spaceHeight(15),
                  UrbanistText().blackBold('Not Found', 24),
                  spaceHeight(8),
                  const Text(
                    'No course ongoing at this time. Please enroll course now!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: ('Urbanist'),
                      fontSize: 20,
                    ),
                  ),
                  spaceHeight(20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          TransisiHalaman(
                            tipe: PageTransitionType.leftToRight,
                            page: AllCoursePage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: UrbanistText().whiteBold('Search Course', 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: RepoColor().color1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: courseController.dataCourseOnGoing.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                final dataEnrol = courseController.CourseOnGoing[index];
                return ItemCourseOnGoing(
                  data: dataEnrol,
                );
              },
            ),
    );
  }
}

class ItemCompletedeTabBar extends StatefulWidget {
  const ItemCompletedeTabBar({Key? key}) : super(key: key);

  @override
  State<ItemCompletedeTabBar> createState() => _ItemCompletedeTabBarState();
}

class _ItemCompletedeTabBarState extends State<ItemCompletedeTabBar> {
  String? fullName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<CourseController>(context, listen: false)
            .getDataAllCourseCompleted();
      });
    }
    getDataPref();
  }

  getDataPref() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullName');
    });
  }

  @override
  Widget build(BuildContext context) {
    final courseController = Provider.of<CourseController>(context);

    if (courseController.dataState == DataState.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (courseController.dataState == DataState.error) {
      return RefreshIndicator(
        onRefresh: () async {
          Provider.of<CourseController>(context, listen: false)
              .getDataAllCourseCompleted();
        },
        child: Center(
          child: UrbanistText().blackNormal('Something went wrong!', 14),
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: () async {
        Provider.of<CourseController>(context, listen: false)
            .getDataAllCourseCompleted();
      },
      child: courseController.dataCourseCompleted.isEmpty
          ? Center(
              child: Column(
                children: [
                  Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: Svg('assets/images/search.svg'),
                      ),
                    ),
                  ),
                  spaceHeight(15),
                  UrbanistText().blackBold('Not Found', 24),
                  spaceHeight(8),
                  const Text(
                    'Sorry, the completed course was not found. Please register the course and complete the course!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: ('Urbanist'),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: courseController.CourseCompleted.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                final dataCompleted = courseController.CourseCompleted[index];
                return ItemCourseCompleted(
                    data: dataCompleted, fullName: fullName);
              },
            ),
    );
  }
}

class ItemLessonsCompletedTabBar extends StatelessWidget {
  List? lesson;
  ItemLessonsCompletedTabBar({Key? key, this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: lesson?.length,
      padding: const EdgeInsets.only(bottom: 20),
      itemBuilder: (context, index) {
        final data = lesson?[index];
        List lesson2 = lesson?[index]['lesson'];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceHeight(20),
            UrbanistText().blackBold('${data['section']}', 18),
            spaceHeight(10),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: lesson2.length,
              itemBuilder: (context, idx) {
                return ItemLessonLock(data: lesson2, idx: idx);
              },
            )
          ],
        );
      },
    );
  }
}
