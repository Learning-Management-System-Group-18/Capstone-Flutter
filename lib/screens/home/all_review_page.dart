import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/constants/icon.dart';
import 'package:capstone_flutter/controllers/HomeController.dart';
import 'package:capstone_flutter/models/reviews_model.dart' as m_review;
import 'package:capstone_flutter/widgets/item_listview.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllReviewPage extends StatefulWidget {
  int courseId;
  double? rating;
  String? title;
  AllReviewPage(
      {Key? key,
      required this.courseId,
      required this.rating,
      required this.title})
      : super(key: key);

  @override
  State<AllReviewPage> createState() => _AllReviewPageState();
}

class _AllReviewPageState extends State<AllReviewPage> {
  int? ratechoice;
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
        title: UrbanistText().whiteBold('All Review ${widget.title}', 18),
        backgroundColor: RepoColor().color1,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side:
                              BorderSide(width: 1.0, color: RepoColor().color1),
                        ),
                        elevation: 0.0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              ratechoice = 0;
                            });
                          },
                          child: Center(
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              width: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RepoIcon().star,
                                  spaceWidth(3),
                                  UrbanistText().blackNormal('All', 16)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side:
                              BorderSide(width: 1.0, color: RepoColor().color1),
                        ),
                        elevation: 0.0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              ratechoice = 1;
                            });
                          },
                          child: Center(
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              width: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RepoIcon().star,
                                  spaceWidth(3),
                                  UrbanistText().blackNormal('1', 16)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side:
                              BorderSide(width: 1.0, color: RepoColor().color1),
                        ),
                        elevation: 0.0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              ratechoice = 2;
                            });
                          },
                          child: Center(
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              width: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RepoIcon().star,
                                  spaceWidth(3),
                                  UrbanistText().blackNormal('2', 16)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side:
                              BorderSide(width: 1.0, color: RepoColor().color1),
                        ),
                        elevation: 0.0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              ratechoice = 3;
                            });
                          },
                          child: Center(
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              width: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RepoIcon().star,
                                  spaceWidth(3),
                                  UrbanistText().blackNormal('3', 16)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side:
                              BorderSide(width: 1.0, color: RepoColor().color1),
                        ),
                        elevation: 0.0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              ratechoice = 4;
                            });
                          },
                          child: Center(
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              width: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RepoIcon().star,
                                  spaceWidth(3),
                                  UrbanistText().blackNormal('4', 16)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side:
                              BorderSide(width: 1.0, color: RepoColor().color1),
                        ),
                        elevation: 0.0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              ratechoice = 5;
                            });
                          },
                          child: Center(
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              width: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RepoIcon().star,
                                  spaceWidth(3),
                                  UrbanistText().blackNormal('5', 16)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              spaceHeight(10),
              if (ratechoice == 0 || ratechoice == null) ...[
                FutureBuilder<List<m_review.Data>>(
                  future: homeController.getDataAllReviewByCourseId(
                      courseId: widget.courseId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            final review = snapshot.data?[index];
                            return ItemReview(
                              dataReview: review!,
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: UrbanistText().blackNormal('Nothing', 13),
                        );
                      }
                    } else {
                      return Center(
                        child: UrbanistText().blackBold('Please wait...', 13),
                      );
                    }
                  },
                ),
              ] else ...[
                FutureBuilder<List<m_review.Data>>(
                  future: homeController.getDataAllReviewByCourseIdByRating(
                      courseId: widget.courseId, rating: ratechoice),
                  builder: (context, snapshot) {
                    print('snaphshot re : $snapshot');
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            final review = snapshot.data?[index];
                            return ItemReview(
                              dataReview: review!,
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: UrbanistText().blackNormal('Nothing', 13),
                        );
                      }
                    } else {
                      return Center(
                        child: UrbanistText().blackBold('Please wait...', 13),
                      );
                    }
                  },
                ),
              ],
              spaceHeight(20),
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
