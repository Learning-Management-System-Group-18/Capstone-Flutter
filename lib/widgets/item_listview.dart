import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/constants/icon.dart';
import 'package:capstone_flutter/screens/course/course_ongoing_page.dart';
import 'package:capstone_flutter/screens/home/detailcoursepage.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:capstone_flutter/widgets/transition.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:progresso/progresso.dart';

import '../screens/course/course_completed_page.dart';

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

class ItemPopularCourses extends StatelessWidget {
  const ItemPopularCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailCoursePage()));
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
                    image: NetworkImage(
                        'https://www.cdmi.in/courses@2x/flutter-training-institute.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              spaceHeight(15),
              UrbanistText().blackBold('Office Productifity', 18),
              spaceHeight(8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber[400]),
                  UrbanistText().blackNormal('4.8 (230 reviews)', 14)
                ],
              ),
              Row(
                children: [
                  Icon(Icons.person, color: Colors.blue),
                  UrbanistText().blackNormal('56 Employees', 14)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCategory extends StatelessWidget {
  String? kategori;
  ItemCategory({Key? key, this.kategori}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: UrbanistText().blackNormal('$kategori', 14),
        ),
      ),
    );
  }
}

class ItemAllCourse extends StatelessWidget {
  const ItemAllCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
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
            spaceWidth(10),
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
    );
  }
}

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

class ItemLesson extends StatelessWidget {
  final data;
  int? idx;
  ItemLesson({Key? key, this.data, this.idx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}

class ItemLessonOnGoing extends StatelessWidget {
  const ItemLessonOnGoing({Key? key}) : super(key: key);

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
                  SizedBox(
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Progresso(
                        progress: 1,
                        progressStrokeCap: StrokeCap.round,
                        backgroundStrokeCap: StrokeCap.round,
                        backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                        progressColor: RepoColor().color1,
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
