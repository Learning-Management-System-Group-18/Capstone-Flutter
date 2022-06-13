import 'package:flutter/material.dart';

import '../../constants/icon.dart';
import '../../widgets/text.dart';

class EmailSupportPage extends StatelessWidget {
  const EmailSupportPage({Key? key}) : super(key: key);

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
        title: UrbanistText().blackBold('Email Support', 18),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(20),
        child: UrbanistText().blackNormal('Email Support', 20),
      ),
    );
  }
}
