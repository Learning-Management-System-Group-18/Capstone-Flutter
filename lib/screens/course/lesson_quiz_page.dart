import 'dart:io';

import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/controllers/CourseController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pod_player/pod_player.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../constants/icon.dart';
import '../../constants/state.dart';
import '../../widgets/text.dart';

class LessonQuizPage extends StatefulWidget {
  final int? id;
  final String? link;
  final String? title;
  LessonQuizPage(
      {Key? key, required this.id, required this.link, required this.title})
      : super(key: key);

  @override
  State<LessonQuizPage> createState() => _LessonQuizPageState();
}

class _LessonQuizPageState extends State<LessonQuizPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<CourseController>(context, listen: false)
            .getDataQuizByIdQuiz(quizId: widget.id!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final courseController = Provider.of<CourseController>(context);
    if (courseController.dataQuiz?.completed == false ||
        courseController.dataQuiz != null) {
      courseController.defaultLessonColor = RepoColor().color1;
    } else {
      courseController.defaultLessonColor = RepoColor().colorGreen;
    }
    print('Link : ${widget.link}');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: RepoIcon().whitearrowCircle,
        ),
        title: UrbanistText().whiteBold('${widget.title}', 18),
        backgroundColor: courseController.defaultLessonColor,
        elevation: 0,
      ),
      body: QuizScreen(link: widget.link),
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
            courseController.changeColor(RepoColor().colorGreen);
            courseController.completedQuiz(context, widget.id!);
          },
          child: UrbanistText().whiteBold("Completed", 16),
          style: ElevatedButton.styleFrom(
            elevation: 10,
            primary: courseController.defaultLessonColor,
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

class QuizScreen extends StatefulWidget {
  String? link;
  QuizScreen({Key? key, this.link}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    String src = widget.link!;

    // String src =
    //     "https://docs.google.com/forms/d/e/1FAIpQLScTSqhotDVyXVi9AoaYF3uvUI7Q2e06Ap81ED6-mUvClzLrzg/viewform?embedded=true";

    // String htmlpage = '''
    // <iframe
    // src="${src}" mozallowfullscreen="true" webkitallowfullscreen="true"
    // frameborder="0" style="overflow:hidden;overflow-x:hidden;overflow-y:hidden;height:100%;width:100%;position:absolute;top:0%;left:0px;right:0px;bottom:0px" height="100%" width="100%" allowfullscreen></iframe>
    // ''';

    // bool webView = true;
    // bool webViewJs = true;
    // return HtmlWidget(
    //   htmlpage,
    //   // ignore: deprecated_member_use
    //   webView: webView,
    //   // ignore: deprecated_member_use
    //   webViewJs: webViewJs,
    // );
    return Stack(
      children: [
        WebView(
          initialUrl: src,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (finish) {
            setState(() {
              isLoading = false;
            });
          },
        ),
        isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(),
      ],
    );
  }
}
