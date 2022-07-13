import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

PageTransition TransisiHalaman(
    {required PageTransitionType tipe,
    Alignment? align,
    required Widget page}) {
  return PageTransition(
    type: tipe,
    alignment: align,
    duration: const Duration(milliseconds: 300),
    reverseDuration: const Duration(milliseconds: 300),
    child: page,
  );
}
