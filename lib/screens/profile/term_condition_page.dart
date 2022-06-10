import 'package:flutter/material.dart';

import '../../constants/icon.dart';
import '../../widgets/text.dart';

class TermConditionPage extends StatelessWidget {
  const TermConditionPage({Key? key}) : super(key: key);

  @override
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
        title: UrbanistText().blackBold('Terms and Condition', 18),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(20),
        child: UrbanistText().blackNormal('Terms and Condition', 20),
      ),
    );
  }
}
