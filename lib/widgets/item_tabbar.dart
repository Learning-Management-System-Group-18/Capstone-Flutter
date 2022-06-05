import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/constants/icon.dart';
import 'package:capstone_flutter/widgets/item_lesson.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:flutter/material.dart';

class ItemAboutTabBar extends StatelessWidget {
  const ItemAboutTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceHeight(15),
            UrbanistText().blackBold('Mentor', 18),
            spaceHeight(10),
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 20,
                ),
                spaceWidth(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UrbanistText().blackBold('Jonathan Williams', 16),
                    UrbanistText().blackNormal('Senoir of ', 16),
                  ],
                )
              ],
            ),
            spaceHeight(20),
            UrbanistText().blackBold('About Course', 18),
            spaceHeight(10),
            UrbanistText().blackNormal(
                'Lörem ipsum våliga sost oaktat is anade. Elektrokrati laktigt en ock. Lasse Berghagen-vin cosplay, i eurokar. Oliga tregt därför att rekör plus nese nihuliga. Karassa löpsedelsteater. Hemingar euligen vade viskade men spefolingar. Dengen bioheten gusen. Prel tinde rerat, att ode prerat. ',
                16),
            spaceHeight(50),
          ],
        ),
      ),
    );
  }
}

class ItemLessonsTabBar extends StatelessWidget {
  List? lesson;
  ItemLessonsTabBar({Key? key, this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceHeight(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UrbanistText().blackBold('20 Lessons', 18),
                TextButton(
                  onPressed: () {},
                  child: UrbanistText().blackBold('See All', 18),
                ),
              ],
            ),
            Container(
              height: 600,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: lesson?.length,
                itemBuilder: (context, index) {
                  final data = lesson?[index];
                  List lesson2 = lesson?[index]['lesson'];
                  print(lesson2);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spaceHeight(20),
                      UrbanistText().blackBold('${data['section']}', 18),
                      spaceHeight(10),
                      ItemLesson(data: lesson2, idx: index),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
