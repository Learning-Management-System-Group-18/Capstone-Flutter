import 'dart:io';
import 'package:capstone_flutter/controllers/ProfileController.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
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

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var dateController = TextEditingController();
  var genderController = TextEditingController();
  var addressController = TextEditingController();

  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

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
    phoneController = TextEditingController(text: data?.phoneNumber ?? '');
    genderController = TextEditingController(text: data?.gender ?? '');
    addressController = TextEditingController(text: data?.address ?? '');

    var image_user = data?.urlImage;
    var items = [
      'MALE',
      'FEMALE',
    ];
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
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                imageprofile(context, image_user),
                spaceHeight(20),
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
                  key: const Key('nohp'),
                  style: UrbanistText().styleText(16),
                  controller: phoneController,
                  decoration: input_decoration('Phone number'),
                ),
                spaceHeight(20),
                Row(
                  children: [
                    UrbanistText().blackBold('Date of Birth : ', 14),
                    spaceWidth(3),
                    UrbanistText().blackNormal(
                        '${data?.dateOfBirth ?? 'Please input your birth'}',
                        14),
                  ],
                ),
                spaceHeight(10),
                widgetDate(context),
                spaceHeight(20),
                TextFormField(
                  key: const Key('jenis kelamin'),
                  style: UrbanistText().styleText(16),
                  controller: genderController,
                  readOnly: true,
                  decoration: InputDecoration(
                    suffixIcon: PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value) {
                        genderController.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return items.map<PopupMenuItem<String>>((String value) {
                          return PopupMenuItem(
                              child: Text(value), value: value);
                        }).toList();
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: RepoColor().color1, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: UrbanistText().styleText(14),
                    hintText: 'Gender',
                    focusColor: RepoColor().color4,
                    filled: true,
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                ),
                spaceHeight(20),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: RepoColor().color1, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: UrbanistText().styleText(14),
                    hintText: "Address",
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
                spaceHeight(50),
              ],
            ),
          ),
        ),
      ),
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
            final birth = data?.dateOfBirth;
            final image = data?.urlImage;
            if (dateController.text != '' && file != null) {
              profileController.updateProfileandImage(
                  context,
                  phoneController.text,
                  dateController.text,
                  genderController.text,
                  addressController.text,
                  file as File);
            } else if (dateController.text == '' || file != null) {
              profileController.updateProfileandImage(
                  context,
                  phoneController.text,
                  birth,
                  genderController.text,
                  addressController.text,
                  file as File);
            } else if (dateController.text != '' || file == null) {
              profileController.updateProfileWithImage(
                  context,
                  phoneController.text,
                  dateController.text,
                  genderController.text,
                  addressController.text,
                  image);
            } else if (dateController.text == '' && file == null) {
              profileController.updateProfileWithImage(
                  context,
                  phoneController.text,
                  birth,
                  genderController.text,
                  addressController.text,
                  image);
            }
          },
          child: UrbanistText().whiteBold("Edit Profile", 16),
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

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                child: const Text("PICK FROM GALLERY"),
              ),
              Container(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("PICK FROM CAMERA"),
              ),
            ],
          )
        ],
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
      isDense: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    );
  }

  Widget widgetDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: dateController,
          style: UrbanistText().styleText(16),
          focusNode: AlwaysDisabledFocusNode(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: RepoColor().color1, width: 1.0),
              borderRadius: BorderRadius.circular(10),
            ),
            hintStyle: UrbanistText().styleText(14),
            hintText: "dd-mm-yyyy",
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
                dateController
                  ..text = DateFormat('dd-MM-yyyy').format(_dueDate)
                  ..selection = TextSelection.fromPosition(
                    TextPosition(
                        offset: dateController.text.length,
                        affinity: TextAffinity.upstream),
                  );
              }
            });
          },
        ),
      ],
    );
  }

  Widget imageprofile(BuildContext context, String? urlImage) {
    return Stack(
      children: [
        if (urlImage == null) ...[
          const CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage('assets/images/profile.png')),
        ] else if (file != null) ...[
          CircleAvatar(
              radius: 70.0,
              backgroundImage: Image.file(
                file!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ).image),
        ] else ...[
          CircleAvatar(
              radius: 70.0,
              backgroundImage: Image.network(
                urlImage,
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

  // void _openFile(PlatformFile file) {
  //   OpenFile.open(file.path);
  // }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
