import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/controllers/HomeController.dart';
import 'package:capstone_flutter/widgets/item_listview.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:capstone_flutter/models/section_model.dart' as m_section;
import 'package:capstone_flutter/models/content_model.dart' as m_content;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/icon.dart';

class AllLessonPage extends StatefulWidget {
  int courseId;
  String? title;
  AllLessonPage({Key? key, required this.courseId, required this.title})
      : super(key: key);

  @override
  State<AllLessonPage> createState() => _AllLessonPageState();
}

class _AllLessonPageState extends State<AllLessonPage> {
  @override
  void initState() {
    // TODO: implement initState
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
    final homeController = Provider.of<HomeController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: RepoIcon().whitearrowCircle,
        ),
        title: UrbanistText().whiteBold('All Lessons ${widget.title}', 18),
        backgroundColor: RepoColor().color1,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        builder:
                            (context, AsyncSnapshot<m_content.Data> snapshot) {
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
        ),
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
            homeController.createOrderCourse(
              context,
              widget.courseId,
              widget.title!,
            );
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
