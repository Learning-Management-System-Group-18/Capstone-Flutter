import 'dart:io';

import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/constants/state.dart';
import 'package:capstone_flutter/controllers/CourseController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../constants/icon.dart';
import '../../widgets/text.dart';

class LessonSlidePage extends StatefulWidget {
  final int? id;
  final String? link;
  final String? title;
  LessonSlidePage(
      {Key? key, required this.id, required this.link, required this.title})
      : super(key: key);

  @override
  State<LessonSlidePage> createState() => _LessonSlidePageState();
}

class _LessonSlidePageState extends State<LessonSlidePage> {
  @override
  void initState() {
    super.initState();
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<CourseController>(context, listen: false)
            .getDataSlideByIdSlide(slideId: widget.id!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final courseController = Provider.of<CourseController>(context);
    if (courseController.dataSlide?.completed == false) {
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
        title: UrbanistText().whiteBold(widget.title!, 18),
        backgroundColor: courseController.defaultLessonColor,
        elevation: 0,
      ),
      body: SlideScreen(link: widget.link),
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
            courseController.completedSlide(context, widget.id!);
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

class SlideScreen extends StatefulWidget {
  String? link;
  SlideScreen({Key? key, this.link}) : super(key: key);

  @override
  State<SlideScreen> createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    String src = widget.link!;
    // String src =
    //     "https://docs.google.com/presentation/d/e/2PACX-1vTylB8xpv8nZrfx4c3eOPRg18mtD6X_EefbU6-iBeqMsAGrDjNAUWYb_BLp19lO0XaEM9R3EyqQoPB6/embed?start=false&loop=false&delayms=3000";

    // String htmlpage = '''
    // <iframe
    // src="${src}" mozallowfullscreen="true" webkitallowfullscreen="true"
    // frameborder="0" style="overflow:hidden;overflow-x:hidden;overflow-y:hidden;height:100%;width:100%;position:absolute;top:0%;left:0px;right:0px;bottom:0px" height="100%" width="100%" allowfullscreen></iframe>
    // ''';
    // bool webView = true;
    // bool webViewJs = true;
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
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(),
      ],
    );
  }
}
