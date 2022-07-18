import 'dart:io';

import 'package:capstone_flutter/api/user_repository.dart';
import 'package:capstone_flutter/models/user_model.dart' as m_user;
import 'package:capstone_flutter/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends ChangeNotifier {
  final UserRepository _userRepository = UserRepository();
  var datauser;
  m_user.Data? get dataProfileUser => datauser;

  getAllDataUser() async {
    final userdata = await _userRepository.getDataUser();
    datauser = userdata;
    notifyListeners();
  }

  updateProfileandImage(BuildContext context, String phone, final String? birth,
      String gender, String address, File? file) async {
    final profileUpdate =
        await _userRepository.updateDataUser(phone, birth!, gender, address);
    final imageUpdate = await _userRepository.updateImageUser(file);
    if (profileUpdate?.status?.code == "SUCCESS" ||
        imageUpdate?.status?.code == "SUCCESS") {
      AlertSucces(context, 'Profile Succesfully Updated!');
    } else {
      AlertInfo(context, 'Something went wrong!');
    }
  }

  updateProfileWithImage(BuildContext context, String phone,
      final String? birth, String gender, String address, String? image) async {
    print('birth : $birth');
    print('gender : $gender');
    final profileUpdate = await _userRepository.updateDataUserWithImage(
        phone, birth!, gender, address, image);
    print('profile wirh imahhe : $profileUpdate');
    if (profileUpdate?.status?.code == "SUCCESS") {
      AlertSucces(context, 'Profile Succesfully Updated!');
    } else {
      AlertInfo(context, 'Somthing went wrong!');
    }
  }

  // updateImage(BuildContext context, File? file) async {
  //   final imageUpdate = await _userRepository.updateImageUser(file!);
  //   if (imageUpdate?.status?.code == "SUCCESS") {
  //     AlertSucces(context, 'Profile Succesfully Updated!');
  //   } else {
  //     AlertInfo(context, 'Somthing went wrong!');
  //   }
  // }
}
