import 'package:capstone_flutter/constants/colors.dart';
// import 'package:capstone_flutter/widgets/text.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

Future AlertSucces(BuildContext context, String text) {
  return CoolAlert.show(
    context: context,
    type: CoolAlertType.success,
    text: text,
  );
}

Future EnrollSucces(BuildContext context, String text) {
  return CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      borderRadius: 25,
      title: 'Enroll Course Successful!',
      backgroundColor: Colors.white,
      confirmBtnColor: RepoColor().color1,
      confirmBtnText: 'View Course',
      text: text,
      confirmBtnTextStyle:
          const TextStyle(fontSize: 16, fontFamily: 'Urbanist', color: Colors.white));
}

Future AlertInfo(BuildContext context, String text) {
  return CoolAlert.show(
    context: context,
    type: CoolAlertType.info,
    text: text,
  );
}

Future AlertConfirm(BuildContext context, String text, dynamic func) {
  return CoolAlert.show(
    context: context,
    type: CoolAlertType.confirm,
    text: text,
    onConfirmBtnTap: func,
  );
}

Future AlertError(BuildContext context, String text) {
  return CoolAlert.show(
    context: context,
    type: CoolAlertType.error,
    text: text,
  );
}
