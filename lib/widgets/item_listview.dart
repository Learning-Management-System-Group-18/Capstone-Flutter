import 'package:cached_network_image/cached_network_image.dart';
import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/constants/icon.dart';
import 'package:capstone_flutter/models/categories_model.dart' as m_category;
import 'package:capstone_flutter/models/content_model.dart' as m_content;
import 'package:capstone_flutter/models/course_model.dart' as m_course;
import 'package:capstone_flutter/models/order_model.dart' as m_order;
import 'package:capstone_flutter/models/reviews_model.dart' as m_review;
import 'package:capstone_flutter/models/tools_model.dart' as m_tool;
import 'package:capstone_flutter/screens/course/course_ongoing_page.dart';
import 'package:capstone_flutter/screens/course/course_review_page.dart';
import 'package:capstone_flutter/screens/course/lesson_quiz_page.dart';
import 'package:capstone_flutter/screens/course/lesson_slide_page.dart';
import 'package:capstone_flutter/screens/course/lesson_video_page.dart';
import 'package:capstone_flutter/screens/home/course_categories_page.dart';
import 'package:capstone_flutter/screens/home/detailcoursepage.dart';
import 'package:capstone_flutter/widgets/alert.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:capstone_flutter/widgets/transition.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:progresso/progresso.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/CourseController.dart';
import '../screens/course/course_completed_page.dart';

//Item ListView TopMentor
class ItemTopMentor extends StatelessWidget {
  String? nama;
  ItemTopMentor({
    Key? key,
    this.nama,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 20,
          ),
          UrbanistText().blackNormal(nama ?? '', 14),
        ],
      ),
    );
  }
}

// //Item PopularCourse di HomePage
class ItemPopularCourses extends StatelessWidget {
  final m_course.Data data;
  ItemPopularCourses({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final idcourse = data.id;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailCoursePage(id: idcourse!)));
        },
        child: Container(
          width: 210,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    height: 121,
                    width: 171,
                    imageUrl: data.urlImage.toString(),
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
              UrbanistText().blackBold(data.title ?? '', 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: RepoColor().color7),
                    ),
                    margin: EdgeInsets.zero,
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 7.5, top: 5, right: 7.5, bottom: 5),
                      child: UrbanistText().blackNormal(
                        data.category?.title ?? '',
                        12,
                      ),
                    ),
                  ),
                  spaceHeight(5),
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
                        '${data.level ?? ''}',
                        12,
                      ),
                    ),
                  ),
                  spaceHeight(10),
                  Row(
                    children: [
                      RepoIcon().star,
                      spaceWidth(5),
                      UrbanistText().blackNormal(
                          '${(data.rating)?.toStringAsFixed(1)} Rating', 14)
                    ],
                  ),
                  spaceHeight(5),
                  Row(
                    children: [
                      RepoIcon().userPrimary,
                      spaceWidth(5),
                      UrbanistText()
                          .blackNormal('${data.countUser ?? 0} employees', 14)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Item ListView Kategori Course
class ItemCategory extends StatelessWidget {
  final m_category.Data data;
  ItemCategory({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: InkWell(
        hoverColor: RepoColor().color9,
        focusColor: RepoColor().color9,
        highlightColor: RepoColor().color9,
        onTap: () {
          Navigator.push(
            context,
            TransisiHalaman(
              tipe: PageTransitionType.rightToLeftWithFade,
              page: CourseCategoriesPage(
                  categoryId: data.id, title: data.title ?? ''),
            ),
          );
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(data.urlImage.toString()),
                ),
                Expanded(
                  child: UrbanistText().blackNormal('${data.title ?? ''}', 13),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Item ListView See All Course
class ItemAllCourse extends StatelessWidget {
  final m_course.Data data;
  ItemAllCourse({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idcourse = data.id;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 2,
      child: InkWell(
        hoverColor: RepoColor().color9,
        focusColor: RepoColor().color9,
        highlightColor: RepoColor().color9,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailCoursePage(id: idcourse!)));
        },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: CachedNetworkImage(
                  width: 100,
                  height: 100,
                  imageUrl: '${data.urlImage ?? ''}',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                      child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator())),
                  errorWidget: (context, url, error) => Image.network(
                      'https://img.freepik.com/free-vector/students-watching-recorded-lecture-with-professor-talking-from-tablet-podcast-courses-audio-video-recording-class-recording-access-concept-vector-isolated-illustration_335657-1983.jpg?w=2000'),
                ),
              ),
              spaceWidth(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UrbanistText().blackBold('${data.title ?? ''}', 18),
                    spaceHeight(2),
                    Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: RepoColor().color8,
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 7.5, top: 5, right: 7.5, bottom: 5),
                        child: UrbanistText().primaryNormal(
                          '${data.level}',
                          12,
                        ),
                      ),
                    ),
                    spaceHeight(5),
                    Row(
                      children: [
                        RepoIcon().star,
                        spaceWidth(5),
                        UrbanistText().blackNormal(
                            '${(data.rating)?.toStringAsFixed(1) ?? 0} Reviews',
                            14),
                      ],
                    ),
                    Row(
                      children: [
                        RepoIcon().userPrimary,
                        spaceWidth(5),
                        UrbanistText().blackNormal(
                            '${data.countUser ?? 0} employees', 14),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Item Review di halaman DetailPage
class ItemReview extends StatelessWidget {
  m_review.Data dataReview;
  ItemReview({Key? key, required this.dataReview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: RepoColor().colorReview,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.png'),
                      radius: 20,
                    ),
                    //   if (imageUrl == null) ...[
                    //   const CircleAvatar(
                    //       radius: 70.0,
                    //       backgroundImage:
                    //           AssetImage('assets/images/profile.png')),
                    // ] else ...[
                    //   ClipOval(
                    //     child: CachedNetworkImage(
                    //       height: 150,
                    //       width: 150,
                    //       imageUrl: imageUrl,
                    //       fit: BoxFit.cover,
                    //       placeholder: (context, url) => const Center(
                    //         child: SizedBox(
                    //           height: 50,
                    //           width: 50,
                    //           child: CircularProgressIndicator(),
                    //         ),
                    //       ),
                    //     ),
                    //   )
                    // ],
                    spaceWidth(8),
                    UrbanistText()
                        .blackBold('${dataReview.user?.fullName}', 16),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     // Row(
                    //     //   children: [
                    //     //     if (dataReview.rating == 1) ...[
                    //     //       star(),
                    //     //     ] else if (dataReview.rating == 2) ...[
                    //     //       star(),
                    //     //       star(),
                    //     //     ] else if (dataReview.rating == 3) ...[
                    //     //       star(),
                    //     //       star(),
                    //     //       star(),
                    //     //     ] else if (dataReview.rating == 4) ...[
                    //     //       star(),
                    //     //       star(),
                    //     //       star(),
                    //     //       star(),
                    //     //     ] else if (dataReview.rating == 5) ...[
                    //     //       star(),
                    //     //       star(),
                    //     //       star(),
                    //     //       star(),
                    //     //       star(),
                    //     //     ]
                    //     //   ],
                    //     // )
                    //   ],
                    // ),
                  ],
                ),
                Row(
                  children: [
                    if (dataReview.rating == 1) ...[
                      cardStar('1'),
                    ] else if (dataReview.rating == 2) ...[
                      cardStar('2'),
                    ] else if (dataReview.rating == 3) ...[
                      cardStar('3'),
                    ] else if (dataReview.rating == 4) ...[
                      cardStar('4'),
                    ] else if (dataReview.rating == 5) ...[
                      cardStar('5'),
                    ]
                  ],
                )
              ],
            ),
            spaceHeight(15),
            UrbanistText().blackNormal('${dataReview.review}', 14),
            spaceHeight(10),
            UrbanistText()
                .blackBold('Tanggal review : ${dataReview.reviewDate}', 14),
          ],
        ),
      ),
    );
  }

  Widget star() {
    return RepoIcon().star15;
  }

  Widget cardStar(String star) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(width: 1.0, color: RepoColor().color1),
      ),
      color: Colors.transparent,
      elevation: 0.0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 7, bottom: 7),
          width: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RepoIcon().primarystarReview,
              spaceWidth(3),
              UrbanistText().primaryBold('$star', 16)
            ],
          ),
        ),
      ),
    );
  }
}

//Item Lesson section di Detail Page
class ItemLessonLock extends StatelessWidget {
  final data;
  int? idx;
  ItemLessonLock({Key? key, this.data, this.idx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int no = 1;
    for (var i = 1; i <= idx!; i++) {
      no++;
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: RepoColor().color1),
      ),
      elevation: 0,
      child: InkWell(
        onTap: () {
          AlertError(context, 'Please to Enroll the Course!');
        },
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              radius: 16,
              backgroundColor: RepoColor().color4,
              child: UrbanistText().primaryNormal('0${no}', 16),
            ),
            title: UrbanistText().blackNormal('${data.title}', 16),
            trailing: RepoIcon().primaryLock,
          ),
        ),
      ),
    );
  }
}

//Item Lesson Video
class ItemLessonVideo extends StatelessWidget {
  final m_content.Video? data;
  int? idx;
  ItemLessonVideo({Key? key, required this.data, this.idx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int no = 1;
    for (var i = 1; i <= idx!; i++) {
      no++;
    }
    final bool? complete = data?.completed;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: RepoColor().color1),
      ),
      elevation: 0,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            TransisiHalaman(
              tipe: PageTransitionType.rightToLeft,
              page: LessonVideoPage(
                id: data?.id,
                link: data?.link,
                title: data?.title,
              ),
            ),
          );
        },
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              radius: 16,
              backgroundColor: RepoColor().color4,
              child: UrbanistText().primaryNormal(no.toString(), 16),
            ),
            title: UrbanistText().blackNormal('${data?.title}', 16),
            trailing: complete == false
                ? RepoIcon().primaryPlay
                : RepoIcon().primaryChecklist,
          ),
        ),
      ),
    );
  }
}

//Item Lesson Slide
class ItemLessonSlide extends StatelessWidget {
  final m_content.Slide? data;
  int? idx;
  ItemLessonSlide({Key? key, required this.data, this.idx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int no = 1;
    for (var i = 1; i <= idx!; i++) {
      no++;
    }
    final bool? complete = data?.completed;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: RepoColor().color1),
      ),
      elevation: 0,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            TransisiHalaman(
              tipe: PageTransitionType.rightToLeft,
              page: LessonSlidePage(
                id: data?.id,
                link: data?.link,
                title: data?.title,
              ),
            ),
          );
        },
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              radius: 16,
              backgroundColor: RepoColor().color4,
              child: UrbanistText().primaryNormal(no.toString(), 16),
            ),
            title: UrbanistText().blackNormal('${data?.title}', 16),
            trailing: complete == false
                ? RepoIcon().primaryPPT
                : RepoIcon().primaryChecklist,
          ),
        ),
      ),
    );
  }
}

//Item Lesson Quiz
class ItemLessonQuiz extends StatelessWidget {
  final m_content.Quiz? data;
  int? idx;
  ItemLessonQuiz({Key? key, required this.data, this.idx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int no = 1;
    for (var i = 1; i <= idx!; i++) {
      no++;
    }
    final bool? complete = data?.completed;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: RepoColor().color1),
      ),
      elevation: 0,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            TransisiHalaman(
              tipe: PageTransitionType.rightToLeft,
              page: LessonQuizPage(
                id: data?.id,
                link: data?.link,
                title: data?.title,
              ),
            ),
          );
        },
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              radius: 16,
              backgroundColor: RepoColor().color4,
              child: UrbanistText().primaryNormal(no.toString(), 16),
            ),
            title: UrbanistText().blackNormal('${data?.title}', 16),
            trailing: complete == false
                ? RepoIcon().primaryExam
                : RepoIcon().primaryChecklist,
          ),
        ),
      ),
    );
  }
}

//Item ListView Course di OnGoing TabBar
class ItemCourseOnGoing extends StatelessWidget {
  m_order.Data data;
  ItemCourseOnGoing({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courseController = Provider.of<CourseController>(context);
    int? countAll = data.countAll;
    int? completed = data.countCompleted;
    double progres = (completed != null && completed != 0) ||
            (countAll != null && countAll != 0)
        ? completed! / countAll!
        : 0;
    Color clrProgres = RepoColor().color2;

    if (progres < 0.35) {
      clrProgres = RepoColor().colorRed;
    } else if (progres > 0.35 && progres < 0.75) {
      clrProgres = RepoColor().colorYellow;
    } else if (progres > 0.75) {
      clrProgres = RepoColor().colorGreen;
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        // side: BorderSide(color: RepoColor().color1, width: 1.5),
      ),
      shadowColor: const Color.fromRGBO(216, 222, 254, 1),
      elevation: 10,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            TransisiHalaman(
              tipe: PageTransitionType.scale,
              align: Alignment.center,
              page: CourseOnGoingPage(
                courseId: data.course?.id ?? 0,
                title: data.course?.title ?? '',
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: CachedNetworkImage(
                  width: 100,
                  height: 100,
                  imageUrl: '${data.course?.urlImage}',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                      child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator())),
                  errorWidget: (context, url, error) => Image.network(
                      'https://img.freepik.com/free-vector/students-watching-recorded-lecture-with-professor-talking-from-tablet-podcast-courses-audio-video-recording-class-recording-access-concept-vector-isolated-illustration_335657-1983.jpg?w=2000'),
                ),
              ),
              spaceWidth(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UrbanistText().blackBold(data.course?.title ?? '', 18),
                    spaceHeight(5),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.zero,
                      elevation: 0.0,
                      color: const Color.fromRGBO(255, 136, 25, 0.05),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                spaceHeight(4),
                                RepoIcon().elipse38,
                              ],
                            ),
                            spaceWidth(5),
                            Column(
                              children: [
                                UrbanistText().warningBold(
                                    data.course?.category?.title ?? '', 12),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    spaceHeight(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Progresso(
                            progress: progres,
                            progressStrokeCap: StrokeCap.round,
                            backgroundStrokeCap: StrokeCap.round,
                            backgroundColor:
                                const Color.fromRGBO(217, 217, 217, 1),
                            backgroundStrokeWidth: 10,
                            progressColor: clrProgres,
                          ),
                        ),
                        SizedBox(
                            child: UrbanistText()
                                .blackNormal('$completed / $countAll', 12)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Item ListView course di Completed TabBar
class ItemCourseCompleted extends StatelessWidget {
  m_order.Data data;
  String? fullName;
  ItemCourseCompleted({Key? key, required this.data, required this.fullName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        // side: BorderSide(color: RepoColor().color1, width: 1.5),
      ),
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            TransisiHalaman(
              tipe: PageTransitionType.scale,
              align: Alignment.center,
              page: CourseOnGoingPage(
                courseId: data.course?.id ?? 0,
                title: data.course?.title ?? '',
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: CachedNetworkImage(
                  width: 100,
                  height: 100,
                  imageUrl: '${data.course?.urlImage}',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                      child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator())),
                  errorWidget: (context, url, error) => Image.network(
                      'https://img.freepik.com/free-vector/students-watching-recorded-lecture-with-professor-talking-from-tablet-podcast-courses-audio-video-recording-class-recording-access-concept-vector-isolated-illustration_335657-1983.jpg?w=2000'),
                ),
              ),
              spaceWidth(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UrbanistText().blackBold('${data.course?.title}', 18),
                    spaceHeight(15),
                    ElevatedButton(
                      onPressed: () async {
                        const snackBar = SnackBar(
                          content: Text('Something went wrong!'),
                        );
                        var url =
                            "http://generatecertif.siangsa.skom.id/?nama=$fullName&course=${data.course?.title}";
                        // ignore: deprecated_member_use
                        await launch(url);

                        // if (await canLaunch(url)) {
                        //   await launch(url);
                        // } else {
                        //   throw 'Could not launch ${url}';
                        // }
                      },
                      child: UrbanistText()
                          .whiteNormal('Download Certificate', 12),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        primary: RepoColor().color1,
                        elevation: 0,
                        minimumSize: Size(50, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    spaceHeight(5),
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          TransisiHalaman(
                            tipe: PageTransitionType.rightToLeftWithFade,
                            page: CourseReviewPage(
                                idCourse: data.course?.id!,
                                title: data.course?.title),
                          ),
                        );
                      },
                      child: UrbanistText().primaryNormal('Write Review', 12),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        elevation: 0,
                        primary: Colors.white,
                        minimumSize: Size(50, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side:
                              BorderSide(color: RepoColor().color1, width: 1.0),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Item Tools yang ada di halaman detail course bagian tab bar about
class ItemTools extends StatelessWidget {
  m_tool.Data tool;
  ItemTools({Key? key, required this.tool}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      color: RepoColor().color9,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(66, 84, 102, 0.2),
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                    '${tool.urlImage.toString()}',
                  ),
                ),
              ),
            ),
            spaceWidth(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UrbanistText().blackBold("${tool.name}", 16),
                  TextButton(
                    onPressed: () async {
                      var url = tool.link.toString();
                      if (await canLaunch(url))
                        await launch(url);
                      else
                        // can't launch url, there is some error
                        throw "Could not launch $url";
                    },
                    child: UrbanistText().blackNormal("Link Download", 14),
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(50, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.centerLeft),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
