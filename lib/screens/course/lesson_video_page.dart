import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/constants/state.dart';
import 'package:capstone_flutter/controllers/CourseController.dart';
import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'package:provider/provider.dart';
import '../../constants/icon.dart';
import '../../widgets/text.dart';

class LessonVideoPage extends StatefulWidget {
  final int? id;
  final String? link;
  final String? title;
  LessonVideoPage(
      {Key? key, required this.id, required this.link, required this.title})
      : super(key: key);

  @override
  State<LessonVideoPage> createState() => _LessonVideoPageState();
}

class _LessonVideoPageState extends State<LessonVideoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<CourseController>(context, listen: false)
            .getDataVideoByIdVideo(videoId: widget.id!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final courseController = Provider.of<CourseController>(context);
    if (courseController.dataVideo?.completed == false) {
      courseController.defaultLessonColor = RepoColor().color1;
    } else {
      courseController.defaultLessonColor = RepoColor().colorGreen;
    }
    // print('Link : ${courseController.dataVideo?.completed}');
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
      body: VideoScreen(src: widget.link.toString()),
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
            courseController.completedVideo(context, widget.id!);
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

class VideoScreen extends StatefulWidget {
  String src;
  VideoScreen({Key? key, required this.src}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<VideoScreen> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
        playVideoFrom: PlayVideoFrom.youtube(widget.src),
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
