import 'package:capstone_flutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pod_player/pod_player.dart';
import '../../constants/icon.dart';
import '../../widgets/text.dart';

class LessonPage extends StatefulWidget {
  String? section, lesson, no;
  LessonPage({Key? key, this.section, this.lesson, this.no}) : super(key: key);

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: RepoIcon().whitearrowCircle,
        ),
        title:
            UrbanistText().whiteBold('${widget.section} ${widget.lesson}', 18),
        backgroundColor: RepoColor().color1,
        elevation: 0,
      ),
      body: showScreen(),
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
          onPressed: () {},
          child: UrbanistText().whiteBold("Completed", 16),
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

  showScreen() {
    if (widget.no == '01') {
      return VideoScreen();
    } else if (widget.no == '02') {
      return SlideScreen();
    } else if (widget.no == '04') {
      return QuizScreen();
    }
  }
}

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<VideoScreen> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
        playVideoFrom: PlayVideoFrom.youtube('https://youtu.be/A3ltMaM6noM'),
        podPlayerConfig: const PodPlayerConfig(
            autoPlay: true, isLooping: false, initialVideoQuality: 360))
      ..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PodVideoPlayer(controller: controller),
      ),
    );
  }
}

class SlideScreen extends StatelessWidget {
  const SlideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String src =
        "https://docs.google.com/presentation/d/e/2PACX-1vTylB8xpv8nZrfx4c3eOPRg18mtD6X_EefbU6-iBeqMsAGrDjNAUWYb_BLp19lO0XaEM9R3EyqQoPB6/embed?start=false&loop=false&delayms=3000";

    String htmlpage = '''
    <iframe
    src="${src}" mozallowfullscreen="true" webkitallowfullscreen="true"
    frameborder="0" style="overflow:hidden;overflow-x:hidden;overflow-y:hidden;height:100%;width:100%;position:absolute;top:0%;left:0px;right:0px;bottom:0px" height="100%" width="100%" allowfullscreen></iframe>
    ''';

    bool webView = true;
    bool webViewJs = true;
    return HtmlWidget(
      htmlpage,
      // ignore: deprecated_member_use
      webView: webView,
      // ignore: deprecated_member_use
      webViewJs: webViewJs,
    );
  }
}

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String src =
        "https://docs.google.com/forms/d/e/1FAIpQLScTSqhotDVyXVi9AoaYF3uvUI7Q2e06Ap81ED6-mUvClzLrzg/viewform?embedded=true";

    String htmlpage = '''
    <iframe
    src="${src}" mozallowfullscreen="true" webkitallowfullscreen="true"
    frameborder="0" style="overflow:hidden;overflow-x:hidden;overflow-y:hidden;height:100%;width:100%;position:absolute;top:0%;left:0px;right:0px;bottom:0px" height="100%" width="100%" allowfullscreen></iframe>
    ''';

    bool webView = true;
    bool webViewJs = true;
    return HtmlWidget(
      htmlpage,
      // ignore: deprecated_member_use
      webView: webView,
      // ignore: deprecated_member_use
      webViewJs: webViewJs,
    );
  }
}
