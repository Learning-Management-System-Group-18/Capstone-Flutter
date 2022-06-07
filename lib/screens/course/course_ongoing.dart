import 'package:flutter/material.dart';

import '../../constants/icon.dart';
import '../../widgets/item_listview.dart';
import '../../widgets/space.dart';
import '../../widgets/text.dart';

class CourseOnGoing extends StatelessWidget {
  const CourseOnGoing({Key? key}) : super(key: key);

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
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: ListView.builder(
            shrinkWrap: true,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 3, bottom: 20),
            itemCount: lesson.length,
            itemBuilder: (context, index) {
              final data = lesson[index];
              List lesson2 = lesson[index]['lesson'];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spaceHeight(20),
                  UrbanistText().blackBold('${data['section']}', 18),
                  spaceHeight(10),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: lesson2.length,
                    itemBuilder: (context, idx) {
                      return ItemLesson(data: lesson2, idx: idx);
                    },
                  )
                ],
              );
            },
          ),
        ));
  }
}
