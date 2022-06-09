import 'dart:io';

import 'package:capstone_flutter/widgets/space.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/colors.dart';
import '../../constants/icon.dart';
import '../../widgets/text.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? file;

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
        title: UrbanistText().blackBold('Edit Profile', 18),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                imageprofile(context),
                spaceHeight(20),
                TextFormField(
                  key: Key('nama'),
                  style: UrbanistText().styleText(16),
                  // controller: emailController,
                  decoration: input_decoration('nama'),
                ),
                spaceHeight(20),
                TextFormField(
                  key: Key('email'),
                  style: UrbanistText().styleText(16),
                  // controller: emailController,
                  decoration: input_decoration('email'),
                ),
                spaceHeight(20),
                TextFormField(
                  key: Key('nohp'),
                  style: UrbanistText().styleText(16),
                  // controller: emailController,
                  decoration: input_decoration('nohp'),
                ),
                spaceHeight(20),
                TextFormField(
                  key: Key('jenis kelamin'),
                  style: UrbanistText().styleText(16),
                  // controller: emailController,
                  decoration: input_decoration('jenis kelamin'),
                ),
                spaceHeight(20),
                TextFormField(
                  key: Key('employee'),
                  style: UrbanistText().styleText(16),
                  // controller: emailController,
                  decoration: input_decoration('employee'),
                ),
                spaceHeight(50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: UrbanistText().whiteBold("Update", 16),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: RepoColor().color1,
                    minimumSize: const Size.fromHeight(56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          UrbanistText().blackNormal('Choose Profile photo', 18),
          spaceHeight(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("PICK FROM GALLERY"),
              ),
              Container(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("PICK FROM CAMERA"),
              ),
            ],
          )
        ],
      ),
    );
  }

  InputDecoration input_decoration(String hint) {
    return InputDecoration(
      hintStyle: GoogleFonts.urbanist(fontSize: 16),
      hintText: hint,
      fillColor: RepoColor().color3,
      filled: true,
      isDense: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    );
  }

  Widget imageprofile(BuildContext context) {
    return Stack(
      children: [
        if (file == null) ...[
          CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage('assets/images/profile.png')),
        ] else ...[
          CircleAvatar(
              radius: 70.0,
              backgroundImage: Image.file(
                file!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ).image),
        ],
        Positioned(
          bottom: 15.0,
          right: 15.0,
          child: InkWell(
            onTap: () {
              // showModalBottomSheet(
              //     context: context,
              //     builder: ((builder) => bottomSheet(context)));
              _pickFile();
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.camera_alt_outlined,
                color: RepoColor().color1,
                size: 28.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    SharedPreferences pref = await SharedPreferences.getInstance();
    var dataprofile = pref.getString("imageProfile");
    if (result != null) {
      String imageProfile = '';
      setState(() {
        file = File(result.files.single.path ?? "");
        imageProfile = result.files.single.path ?? "";
        if (dataprofile != null) {
          pref.remove("imageProfile");
          pref.setString("imageProfile", imageProfile);
        } else {
          pref.setString("imageProfile", imageProfile);
        }
      });
    }
    print(file);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
