import 'package:capstone_flutter/widgets/item_tabbar.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/icon.dart';
import '../../widgets/text.dart';

class CourseCompletedPage extends StatelessWidget {
  const CourseCompletedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      {
        'section': 'Section 5 - Flutter Introduction',
        'lesson': [
          ['01', 'Video', 'url'],
          ['02', 'Slide', 'url'],
          ['03', 'Latihan', 'url'],
          ['04', 'Quiz', 'url'],
          ['05', 'Test', 'url'],
        ]
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: RepoIcon().arrowCircle,
        ),
        title: UrbanistText().blackBold('Office Productifity', 18),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _tabSection(context, lesson),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _tabSection(
  BuildContext context,
  List lesson,
) {
  return DefaultTabController(
    length: 2,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          color: Colors.white,
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
                    'Lessons',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Urbanist'),
                  ),
                ),
                Tab(
                  child: Text(
                    'Certificate',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Urbanist'),
                  ),
                ),
              ]),
        ),
        SizedBox(
          height: 620,
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ItemLessonsCompletedTabBar(
                lesson: lesson,
              ),
              // const ItemReviewTabBar(),
            ],
          ),
        ),
      ],
    ),
  );
}
