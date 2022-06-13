import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/constants/icon.dart';
import 'package:capstone_flutter/widgets/alert.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:flutter/material.dart';

import '../../widgets/item_tabbar.dart';

class DetailCoursePage extends StatefulWidget {
  const DetailCoursePage({Key? key}) : super(key: key);

  @override
  State<DetailCoursePage> createState() => _DetailCoursePageState();
}

class _DetailCoursePageState extends State<DetailCoursePage> {
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;

  List lesson = [
    {
      'section': 'Section 1 - Introduction',
      'lesson': [
        ['01', 'Video', 'url'],
        ['02', 'Slide', 'url'],
        ['03', 'Latihan', 'url'],
        ['04', 'Quiz', 'url'],
      ]
    },
    {
      'section': 'Section 2 - Flutter Introduction',
      'lesson': [
        ['01', 'Video', 'url'],
        ['02', 'Slide', 'url'],
        ['03', 'Latihan', 'url'],
        ['04', 'Quiz', 'url'],
      ]
    },
    {
      'section': 'Section 3 - Introduction',
      'lesson': [
        ['01', 'Video', 'url'],
        ['02', 'Slide', 'url'],
        ['03', 'Latihan', 'url'],
        ['04', 'Quiz', 'url'],
      ]
    },
    {
      'section': 'Section 4 - Flutter Introduction',
      'lesson': [
        ['01', 'Video', 'url'],
        ['02', 'Slide', 'url'],
        ['03', 'Latihan', 'url'],
        ['04', 'Quiz', 'url'],
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 200.0,
            title: UrbanistText().whiteBold('Office Productifity', 20),
            backgroundColor: RepoColor().color1,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              background: Image(
                image: NetworkImage(
                    'https://www.cdmi.in/courses@2x/flutter-training-institute.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UrbanistText().blackBold('Office Productifity', 24),
                  spaceHeight(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              spaceWidth(10),
                              UrbanistText()
                                  .blackNormal('4.8 (230 reviews)', 16),
                            ],
                          ),
                          spaceHeight(10),
                          Row(
                            children: [
                              RepoIcon().employee2,
                              spaceWidth(8),
                              UrbanistText().blackNormal('56 employees', 16),
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
                              UrbanistText().blackNormal('2,5 Hours', 16),
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
                  _tabSection(context, lesson),
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
            EnrollSucces(context, 'You have successfully enrolled the course');
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

Widget _tabSection(BuildContext context, List lesson) {
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
              const ItemAboutTabBar(),
              ItemLessonsTabBar(lesson: lesson),
              const ItemReviewTabBar(),
            ],
          ),
        ),
      ],
    ),
  );
}
