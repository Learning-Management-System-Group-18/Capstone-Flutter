import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/constants/icon.dart';
import 'package:capstone_flutter/controllers/CourseController.dart';
import 'package:capstone_flutter/widgets/alert.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../widgets/text.dart';

class CourseReviewPage extends StatefulWidget {
  final int? idCourse;
  final String? title;
  CourseReviewPage({Key? key, required this.idCourse, required this.title})
      : super(key: key);

  @override
  State<CourseReviewPage> createState() => _CourseReviewPageState();
}

class _CourseReviewPageState extends State<CourseReviewPage> {
  final reviewTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double? rating = 3;

  @override
  Widget build(BuildContext context) {
    final courseController = Provider.of<CourseController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: RepoIcon().whitearrowCircle,
        ),
        title: UrbanistText().whiteBold('Review ${widget.title}', 18),
        backgroundColor: RepoColor().color1,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UrbanistText().blackBold('Rating', 20),
                  spaceHeight(18.5),
                  RatingBar.builder(
                    initialRating: rating!,
                    itemPadding: const EdgeInsets.only(right: 8.0),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return RepoIcon().starReview;
                        case 1:
                          return RepoIcon().starReview;
                        case 2:
                          return RepoIcon().starReview;
                        case 3:
                          return RepoIcon().starReview;
                        case 4:
                          return RepoIcon().starReview;
                        default:
                          return UrbanistText().blackNormal('', 12);
                      }
                    },
                    updateOnDrag: true,
                    onRatingUpdate: (rate) {
                      setState(() {
                        rating = rate;
                      });
                    },
                  ),
                  spaceHeight(18.5),
                  UrbanistText().blackBold('Review', 20),
                  spaceHeight(16),
                  TextFormField(
                    controller: reviewTextController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      fillColor: Color.fromRGBO(250, 250, 250, 1),
                      filled: true,
                      hintStyle: UrbanistText().styleText(16),
                      hintText: 'Add your review ...',
                    ),
                    style: UrbanistText().styleText(16),
                    minLines:
                        15, // any number you need (It works as the rows for the textarea)
                    keyboardType: TextInputType.multiline,
                    maxLines: 15,
                  ),
                ],
              ),
            ),
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
            courseController.reviewCourse(
                context, widget.idCourse!, rating, reviewTextController.text);
          },
          child: UrbanistText().whiteBold("Submit Review", 16),
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
