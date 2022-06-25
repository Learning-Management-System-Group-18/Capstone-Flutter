import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/constants/icon.dart';
import 'package:capstone_flutter/models/categories_model.dart' as m_category;
import 'package:capstone_flutter/models/course_model.dart' as m_course;
import 'package:capstone_flutter/screens/course/course_ongoing_page.dart';
import 'package:capstone_flutter/screens/course/lesson_page.dart';
import 'package:capstone_flutter/screens/home/detailcoursepage.dart';
import 'package:capstone_flutter/widgets/alert.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:capstone_flutter/widgets/transition.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:progresso/progresso.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailCoursePage(id: idcourse!)));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 121,
                width: 176,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(data.urlImage.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              spaceHeight(15),
              UrbanistText().blackBold('${data.title}', 18),
              spaceHeight(8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber[400]),
                  UrbanistText().blackNormal('${data.rating} rating', 14)
                ],
              ),
              spaceHeight(5),
              Row(
                children: [
                  // Icon(Icons.person, color: Colors.blue),
                  UrbanistText().blackNormal('${data.description}', 14)
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
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(data.urlImage.toString()),
              ),
              UrbanistText().blackNormal('${data.title}', 14),
            ],
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
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailCoursePage(id: idcourse!)));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(data.urlImage.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              spaceWidth(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UrbanistText().blackBold('Office Productifity', 18),
                  spaceHeight(10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber[400]),
                      UrbanistText().blackNormal('4.8 (230 reviews)', 14),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.blue),
                      UrbanistText().blackNormal('56 employees', 14),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class ItemGridAllCourse extends StatelessWidget {
//   final m_course.Data data;
//   ItemGridAllCourse({Key? key, required this.data}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // Navigator.push(context,
//         // MaterialPageRoute(builder: (context) => DetailCoursePage()));
//       },
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         elevation: 2,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 121,
//                 width: 150,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   image: DecorationImage(
//                     image: NetworkImage(data.urlImage.toString()),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               spaceHeight(15),
//               UrbanistText().blackBold('${data.title}', 18),
//               spaceHeight(8),
//               Row(
//                 children: [
//                   Icon(Icons.star, color: Colors.amber[400]),
//                   UrbanistText().blackNormal('${data.rating} rating', 14)
//                 ],
//               ),
//               spaceHeight(5),
//               Row(
//                 children: [
//                   // Icon(Icons.person, color: Colors.blue),
//                   UrbanistText().blackNormal('${data.description}', 14)
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//Item Review di halaman DetailPage
class ItemReview extends StatelessWidget {
  final dataReview;
  ItemReview({Key? key, this.dataReview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 20,
                ),
                spaceWidth(8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UrbanistText().blackBold('${dataReview['nama']}', 16),
                    Row(
                      children: [
                        if (dataReview['bintang'] == 1) ...[
                          star(),
                        ] else if (dataReview['bintang'] == 2) ...[
                          star(),
                          star(),
                        ] else if (dataReview['bintang'] == 3) ...[
                          star(),
                          star(),
                          star(),
                        ] else if (dataReview['bintang'] == 4) ...[
                          star(),
                          star(),
                          star(),
                          star(),
                        ] else if (dataReview['bintang'] == 5) ...[
                          star(),
                          star(),
                          star(),
                          star(),
                          star(),
                        ]
                      ],
                    )
                  ],
                )
              ],
            ),
            spaceHeight(15),
            UrbanistText().blackNormal('${dataReview['comment']}', 14),
            spaceHeight(10),
            Row(
              children: [
                const Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 233, 18, 64),
                  size: 20,
                ),
                spaceWidth(5),
                UrbanistText().blackNormal('${dataReview['like']}', 14),
                spaceWidth(25),
                UrbanistText()
                    .blackNormal('${dataReview['last_update']} weeks ago', 14),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget star() {
    return Icon(
      Icons.star,
      color: Colors.amber,
      size: 15,
    );
  }
}

//Item Lesson section di Detail Page
class ItemLesson extends StatelessWidget {
  final data;
  int? idx;
  ItemLesson({Key? key, this.data, this.idx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AlertError(context, 'Please to Enroll the Course!');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: RepoColor().color1),
        ),
        elevation: 0,
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              radius: 16,
              backgroundColor: RepoColor().color4,
              child: UrbanistText().primaryNormal('${data[idx][0]}', 16),
            ),
            title: UrbanistText().blackNormal('${data[idx][1]}', 16),
            trailing: RepoIcon().primaryPlay,
          ),
        ),
      ),
    );
  }
}

//Ini item section Ketika Item On Going Di Klik
class ItemLessonCourseOnGoing extends StatelessWidget {
  final data;
  int? idx;
  String? section;
  ItemLessonCourseOnGoing({Key? key, this.data, this.idx, this.section})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          TransisiHalaman(
            tipe: PageTransitionType.rightToLeftWithFade,
            page: LessonPage(
              section: section,
              lesson: data[idx][1],
              no: data[idx][0],
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: RepoColor().color1),
        ),
        elevation: 0,
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              radius: 16,
              backgroundColor: RepoColor().color4,
              child: UrbanistText().primaryNormal('${data[idx][0]}', 16),
            ),
            title: UrbanistText().blackNormal('${data[idx][1]}', 16),
            trailing: RepoIcon().primaryPlay,
          ),
        ),
      ),
    );
  }
}

//Item ListView Course di OnGoing TabBar
class ItemCourseOnGoing extends StatelessWidget {
  const ItemCourseOnGoing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          TransisiHalaman(
            tipe: PageTransitionType.scale,
            align: Alignment.center,
            page: CourseOnGoingPage(),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          // side: BorderSide(color: RepoColor().color1, width: 1.5),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://www.cdmi.in/courses@2x/flutter-training-institute.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UrbanistText().blackBold('Office Productifity', 18),
                  spaceHeight(5),
                  UrbanistText().blackNormal('2 hrs 30 mins', 14),
                  spaceHeight(20),
                  SizedBox(
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Progresso(
                        progress: 0.3,
                        progressStrokeCap: StrokeCap.round,
                        backgroundStrokeCap: StrokeCap.round,
                        backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                        progressColor: RepoColor().colorYellow,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Item ListView course di Completed TabBar
class ItemLessonCompleted extends StatelessWidget {
  const ItemLessonCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          TransisiHalaman(
            tipe: PageTransitionType.scale,
            align: Alignment.center,
            page: CourseCompletedPage(),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          // side: BorderSide(color: RepoColor().color1, width: 1.5),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://www.cdmi.in/courses@2x/flutter-training-institute.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UrbanistText().blackBold('Office Productifity', 18),
                  spaceHeight(5),
                  UrbanistText().blackNormal('2 hrs 30 mins', 14),
                  spaceHeight(20),
                  // SizedBox(
                  //   width: 150,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 10),
                  //     child: Progresso(
                  //       progress: 1,
                  //       progressStrokeCap: StrokeCap.round,
                  //       backgroundStrokeCap: StrokeCap.round,
                  //       backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                  //       progressColor: RepoColor().color1,
                  //     ),
                  //   ),
                  // ),
                  ElevatedButton(
                    onPressed: () async {
                      // Navigator.push(
                      //   context,
                      //   TransisiHalaman(
                      //     tipe: PageTransitionType.rightToLeftWithFade,
                      //     page: WebviewCertificate(
                      //       nama: "Mega rizky",
                      //       course: "Office Productifity",
                      //     ),
                      //   ),
                      // );
                      const url =
                          "http://generatecertif.siangsa.skom.id/?nama=hidayatullah&course=flutter";
                      if (await canLaunch(url))
                        await launch(url);
                      else
                        // can't launch url, there is some error
                        throw "Could not launch $url";
                    },
                    child:
                        UrbanistText().whiteNormal('Download Certificate', 14),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
