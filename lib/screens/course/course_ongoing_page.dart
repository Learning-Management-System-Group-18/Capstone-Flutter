import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/constants/state.dart';
import 'package:capstone_flutter/controllers/CourseController.dart';
import 'package:capstone_flutter/models/content_model.dart' as m_content;
import 'package:capstone_flutter/models/section_model.dart' as m_section;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../../constants/icon.dart';
import '../../widgets/item_listview.dart';
import '../../widgets/space.dart';
import '../../widgets/text.dart';

class CourseOnGoingPage extends StatefulWidget {
  int? courseId;
  String? title;
  CourseOnGoingPage({Key? key, required this.courseId, required this.title})
      : super(key: key);

  @override
  State<CourseOnGoingPage> createState() => _CourseOnGoingPageState();
}

class _CourseOnGoingPageState extends State<CourseOnGoingPage> {
  String? fullname;
  getDataPref() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // path = prefs.getString("imageProfile");
      fullname = prefs.getString('fullName');
      // file = File(path.toString());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<CourseController>(context, listen: false)
            .getDataSectionCourseOrder(courseId: widget.courseId!);
      });
    }
    getDataPref();
  }

  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  var _description = TextEditingController();
  var _namaCourse = TextEditingController();
  var _namauser = TextEditingController();
  var _nohpuser = TextEditingController();
  var _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final courseController = Provider.of<CourseController>(context);

    if (courseController.dataState == DataState.loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (courseController.dataState == DataState.error) {
      return Scaffold(
        body: Center(
          child: UrbanistText()
              .primaryBold('Something went wrong. Please try again!', 14),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: RepoIcon().arrowCircle,
        ),
        title: UrbanistText().blackBold('${widget.title}', 18),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Provider.of<CourseController>(context, listen: false)
              .getDataSectionCourseOrder(courseId: widget.courseId!);
        },
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          height: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 3, bottom: 20),
            itemCount: courseController.sectionCourse.length,
            itemBuilder: (context, index) {
              m_section.Data section = courseController.sectionCourse[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spaceHeight(20),
                  UrbanistText()
                      .blackBold('${index + 1} - ${section.title}', 18),
                  spaceHeight(10),
                  FutureBuilder<m_content.Data>(
                    future: courseController.getDataAllContentBySectionId(
                        sectionId: section.id),
                    builder: (context, AsyncSnapshot<m_content.Data> snapshot) {
                      // if (snapshot.connectionState == ConnectionState.done) {

                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data?.video?.length,
                              itemBuilder: (context, indexLesson) {
                                final m_content.Video dataLesson =
                                    snapshot.data!.video![indexLesson];
                                return ItemLessonVideo(
                                  data: dataLesson,
                                  idx: indexLesson,
                                );
                              },
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data?.slide?.length,
                              itemBuilder: (context, indexLesson) {
                                final m_content.Slide dataLesson =
                                    snapshot.data!.slide![indexLesson];
                                return ItemLessonSlide(
                                  data: dataLesson,
                                  idx: indexLesson,
                                );
                              },
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data?.quiz?.length,
                              itemBuilder: (context, indexLesson) {
                                final m_content.Quiz dataLesson =
                                    snapshot.data!.quiz![indexLesson];
                                return ItemLessonQuiz(
                                  data: dataLesson,
                                  idx: indexLesson,
                                );
                              },
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: UrbanistText()
                              .primaryNormal('Please wait...', 14),
                        );
                      }
                      // } else {
                      //   return Center(
                      //     child: UrbanistText()
                      //         .primaryBold('Something went wrong!', 14),
                      //   );
                      // }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            modalbottomRequestCounseling(context, widget.title!);
          },
          backgroundColor: RepoColor().color10,
          child: RepoIcon().requestCourse),
    );
  }

  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+62895632312548',
      text:
          "---Requset Counseling---\n\nCourse title : ${_namaCourse.text}\nName : ${_namauser.text}\nDate : ${_dateController.text}\nPhone Number : ${_nohpuser.text}\nDescription : ${_description.text}",
    );
    await launch('$link');
  }

  Future<void> modalbottomRequestCounseling(
      BuildContext context, String title) {
    _namaCourse = TextEditingController(text: title);
    _namauser = TextEditingController(text: fullname ?? '');
    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return Container(
          height: 650,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: RepoColor().color1,
                  ),
                  child: UrbanistText().whiteBold('Request Counseling', 20),
                ),
                spaceHeight(5),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        key: const Key('nameCourse'),
                        style: UrbanistText().styleText(16),
                        controller: _namaCourse,
                        readOnly: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: RepoColor().color1, width: 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintStyle: UrbanistText().styleText(14),
                          hintText: "Course name...",
                          focusColor: RepoColor().color4,
                          filled: true,
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                      ),
                      spaceHeight(8),
                      TextFormField(
                        key: const Key('nameUser'),
                        style: UrbanistText().styleText(16),
                        controller: _namauser,
                        readOnly: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: RepoColor().color1, width: 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintStyle: UrbanistText().styleText(14),
                          hintText: "Your name...",
                          focusColor: RepoColor().color4,
                          filled: true,
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                      ),
                      spaceHeight(8),
                      widgetDate(context),
                      spaceHeight(8),
                      TextFormField(
                        key: const Key('phoneUser'),
                        style: UrbanistText().styleText(16),
                        controller: _nohpuser,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: RepoColor().color1, width: 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintStyle: UrbanistText().styleText(14),
                          hintText: "Your phone number...",
                          focusColor: RepoColor().color4,
                          filled: true,
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                      ),
                      spaceHeight(8),
                      TextFormField(
                        controller: _description,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: RepoColor().color1, width: 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintStyle: UrbanistText().styleText(14),
                          hintText: "Add description...",
                          focusColor: RepoColor().color4,
                          filled: true,
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                        style: UrbanistText().styleText(16),
                        minLines:
                            5, // any number you need (It works as the rows for the textarea)
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                      ),
                      spaceHeight(20),
                      Center(
                        child: ElevatedButton(
                          child: const Text('Request now'),
                          onPressed: () {
                            launchWhatsApp();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: RepoColor().color1,
                            minimumSize: const Size.fromHeight(56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget widgetDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _dateController,
          style: UrbanistText().styleText(16),
          focusNode: AlwaysDisabledFocusNode(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: RepoColor().color1, width: 1.0),
              borderRadius: BorderRadius.circular(10),
            ),
            hintStyle: UrbanistText().styleText(14),
            hintText: "dd/mm/yyyy",
            focusColor: RepoColor().color4,
            filled: true,
            isDense: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
          ),
          onTap: () async {
            final selectDate = await showDatePicker(
              context: context,
              initialDate: currentDate,
              firstDate: DateTime(1990),
              lastDate: DateTime(currentDate.year + 5),
            );
            setState(() {
              if (selectDate != null) {
                _dueDate = selectDate;
                _dateController
                  ..text = DateFormat('dd/MM/yyyy').format(_dueDate)
                  ..selection = TextSelection.fromPosition(TextPosition(
                      offset: _dateController.text.length,
                      affinity: TextAffinity.upstream));
              }
            });
          },
        ),
      ],
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
