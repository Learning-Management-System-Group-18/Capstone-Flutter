import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/controllers/HomeController.dart';
import 'package:capstone_flutter/models/content_model.dart' as m_content;
import 'package:capstone_flutter/models/course_model.dart';
import 'package:capstone_flutter/models/mentor_model.dart' as m_mentor;
import 'package:capstone_flutter/models/section_model.dart' as m_section;
import 'package:capstone_flutter/models/tools_model.dart' as m_tool;
import 'package:capstone_flutter/widgets/item_listview.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:progresso/progresso.dart';

class ItemAboutTabBar extends StatefulWidget {
  int courseId;
  String deskripsi;
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
                print(homeController.mentorCourse.length);
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
          // Card(
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   elevation: 0.0,
          //   color: RepoColor().color9,
          //   child: Container(
          //     width: 200,
          //     padding: const EdgeInsets.all(12.0),
          //     child: Row(
          //       children: [
          //         Container(
          //           height: 50,
          //           width: 50,
          //           decoration: BoxDecoration(
          //             border: Border.all(
          //               color: Color.fromRGBO(66, 84, 102, 0.2),
          //               style: BorderStyle.solid,
          //               width: 1.0,
          //             ),
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(8.0),
          //             image: DecorationImage(
          //               image: NetworkImage(
          //                 'https://seeklogo.com/images/N/new-google-maps-icon-logo-263A01C734-seeklogo.com.png',
          //               ),
          //             ),
          //           ),
          //         ),
          //         spaceWidth(10),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             UrbanistText().blackBold("Google Maps", 16),
          //             TextButton(
          //               onPressed: () async {
          //                 var url = "www.googlemaps.com";
          //                 if (await canLaunch(url))
          //                   await launch(url);
          //                 else
          //                   // can't launch url, there is some error
          //                   throw "Could not launch $url";
          //               },
          //               child: UrbanistText().blackNormal("Link Download", 14),
          //               style: TextButton.styleFrom(
          //                   padding: EdgeInsets.zero,
          //                   minimumSize: Size(50, 30),
          //                   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //                   alignment: Alignment.centerLeft),
          //             ),
          //           ],
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          spaceHeight(50),
        ],
      ),
    );
  }
}

class ItemSectionTabBar extends StatefulWidget {
  int courseId;
  ItemSectionTabBar({Key? key, required this.courseId}) : super(key: key);

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
                onPressed: () {},
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
              // List lesson2 = widget.lesson?[index]['lesson'];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spaceHeight(20),
                  UrbanistText()
                      .blackBold('${section.id} - ${section.title}', 18),
                  spaceHeight(10),
                  FutureBuilder<m_content.Data>(
                    future: homeController.getDataAllContentBySectionId(
                        sectionId: idSection),
                    builder: (context, AsyncSnapshot<m_content.Data> snapshot) {
                      if (snapshot.hasData) {
                        print('data snapshot : ${snapshot.data?.video}');
                        return Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data?.video?.length,
                              itemBuilder: (context, indexVid) {
                                final video = snapshot.data?.video?[indexVid];
                                return ItemLessonLock(
                                  data: video,
                                  idx: indexVid,
                                );
                              },
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: snapshot.data?.slide?.length,
                              itemBuilder: (context, indexSli) {
                                final slide = snapshot.data?.slide?[indexSli];
                                return ItemLessonLock(
                                  data: slide,
                                  idx: indexSli,
                                );
                              },
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data?.quiz?.length,
                              itemBuilder: (context, indexSli) {
                                final quiz = snapshot.data?.quiz?[indexSli];
                                return ItemLessonLock(
                                  data: quiz,
                                  idx: indexSli,
                                );
                              },
                            ),
                          ],
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
        'comment': 'Terima kasih, ilmunya sangat bermanfaat hbshdbshdhsd',
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
        return const ItemCourseOnGoing();
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
                return ItemLessonLock(data: lesson2, idx: idx);
              },
            )
          ],
        );
      },
    );
  }
}
