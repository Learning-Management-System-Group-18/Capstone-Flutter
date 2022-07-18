import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/controllers/ProfileController.dart';
import 'package:capstone_flutter/widgets/alert.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:provider/provider.dart';

import '../../constants/icon.dart';
import '../../widgets/text.dart';

class EmailSupportPage extends StatefulWidget {
  const EmailSupportPage({Key? key}) : super(key: key);

  @override
  State<EmailSupportPage> createState() => _EmailSupportPageState();
}

class _EmailSupportPageState extends State<EmailSupportPage> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var subjectController = TextEditingController();
  var messageController = TextEditingController();
  final _keyEmail = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<ProfileController>(context, listen: false).getAllDataUser();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileController = Provider.of<ProfileController>(context);
    final data = profileController.dataProfileUser;
    nameController = TextEditingController(text: data?.user?.fullName ?? '');
    emailController = TextEditingController(text: data?.user?.email ?? '');
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _keyEmail,
            child: Column(
              children: [
                TextFormField(
                  key: const Key('nama'),
                  style: UrbanistText().styleText(16),
                  readOnly: true,
                  controller: nameController,
                  decoration: input_decoration('Full Name'),
                ),
                spaceHeight(20),
                TextFormField(
                  key: const Key('email'),
                  style: UrbanistText().styleText(16),
                  readOnly: true,
                  controller: emailController,
                  decoration: input_decoration('Email'),
                ),
                spaceHeight(20),
                TextFormField(
                  key: const Key('subject'),
                  style: UrbanistText().styleText(16),
                  controller: subjectController,
                  decoration: input_decoration('Subject'),
                ),
                spaceHeight(20),
                TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: RepoColor().color1, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: UrbanistText().styleText(14),
                    hintText: "Write Email",
                    focusColor: RepoColor().color4,
                    filled: true,
                    fillColor: RepoColor().colorFill,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: UrbanistText().styleText(16),
                  minLines:
                      7, // any number you need (It works as the rows for the textarea)
                  keyboardType: TextInputType.multiline,
                  maxLines: 7,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: send,
          child: UrbanistText().whiteBold("Send", 16),
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

  Future<void> send() async {
    final Email email = Email(
      body:
          '--- Email Support Level-Up ---\n\nFull name : ${nameController.text}\nEmail : ${emailController.text}\n\nMessage : ${messageController.text}',
      subject: '${subjectController.text}',
      recipients: ['hidayatullahbp@gmail.com'],
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'Email sent successfully!';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }

  InputDecoration input_decoration(String hint) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: RepoColor().color1, width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      hintStyle: UrbanistText().styleText(14),
      hintText: hint,
      focusColor: RepoColor().color4,
      filled: true,
      fillColor: RepoColor().colorFill,
      isDense: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    );
  }
}
