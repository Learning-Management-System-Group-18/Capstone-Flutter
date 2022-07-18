import 'package:capstone_flutter/widgets/collapse.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:flutter/material.dart';

import '../../constants/icon.dart';
import '../../widgets/text.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: RepoIcon().arrowCircle,
        ),
        title: UrbanistText().blackBold('FAQ', 18),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              collapse(
                title: 'What is Level Up',
                body:
                    'Level Up is an online learning platform for improving employee skills based on their respective roles. With Level Up, employees can access materials, videos, and quizzes anytime for free.',
              ),
              spaceHeight(10),
              collapse(
                title: 'Is Level Up free to use?',
                body: 'Yes, all course is for free.',
              ),
              spaceHeight(10),
              collapse(
                title: 'How to use Level Up?',
                body:
                    'To use Level Up, you must first have an account. Then you go in and search for the course you want to study. You can use the search feature or search for courses by category.',
              ),
              spaceHeight(10),
              collapse(
                title: 'How to enroll course on Level Up?',
                body:
                    'To register for a course, you first select the course you want to study, then you will see the details of the course. After that, you will find the "Enroll Course" button at the bottom. And you just press that button and you have successfully enroll for the course. Then you just have to study the course on the "My Course" page. Happy enjoying.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
