import 'package:capstone_flutter/widgets/item_listview.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:flutter/material.dart';
// import 'package:progresso/progresso.dart';

class ItemAboutTabBar extends StatelessWidget {
  const ItemAboutTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}

class ItemLessonsTabBar extends StatelessWidget {
  List? lesson;
  ItemLessonsTabBar({Key? key, this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: lesson?.length,
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
                      return ItemLesson(data: lesson2, idx: idx);
                    },
                  )
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

class ItemReviewTabBar extends StatelessWidget {
  const ItemReviewTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List review = ['All', 5, 4, 3, 2, 1];

    var dataReview = [
      {
        'nama': 'Dayat',
        'bintang': 5,
        'comment': 'Ini Sangat Bagus',
        'like': 10,
        'last_update': 2,
      },
      {
        'nama': 'Fahlevi',
        'bintang': 3,
        'comment': 'Biasa saja sih. Tapi Lumayan',
        'like': 6,
        'last_update': 9,
      },
      {
        'nama': 'Maulana',
        'bintang': 4,
        'comment': 'Terima kasih, ilmunya sangat bermanfaat',
        'like': 3,
        'last_update': 1,
      },
      {
        'nama': 'Liwi',
        'bintang': 5,
        'comment': 'Keren',
        'like': 99,
        'last_update': 4,
      },
    ];
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
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  spaceWidth(8),
                  UrbanistText().blackBold('4.8 (230 reviews)', 18),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: UrbanistText().blackBold('See All', 18),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: review.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          spaceWidth(3),
                          UrbanistText().blackNormal('${review[index]}', 16)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          spaceHeight(10),
          if (dataReview.isNotEmpty) ...[
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dataReview.length,
              itemBuilder: (context, index) {
                return ItemReview(
                  dataReview: dataReview[index],
                );
              },
            ),
          ] else ...[
            spaceHeight(20),
            Center(
              child: UrbanistText().blackBold('Review belum ada', 15),
            )
          ],
          spaceHeight(20),
        ],
      ),
    );
  }
}

class ItemOnGoingTabBar extends StatelessWidget {
  const ItemOnGoingTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      padding: const EdgeInsets.only(top: 10),
      itemBuilder: (context, index) {
        return const ItemLessonOnGoing();
      },
    );
  }
}

class ItemCompletedeTabBar extends StatelessWidget {
  const ItemCompletedeTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      padding: const EdgeInsets.only(top: 10),
      itemBuilder: (context, index) {
        return const ItemLessonCompleted();
      },
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
                return ItemLesson(data: lesson2, idx: idx);
              },
            )
          ],
        );
      },
    );
  }
}
