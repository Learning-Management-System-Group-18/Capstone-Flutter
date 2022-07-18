import 'package:capstone_flutter/widgets/text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

Widget collapse({required String title, required String body}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    color: Colors.white,
    elevation: 10,
    shadowColor: RepoColor().colorShadow,
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: ExpandablePanel(
        header: UrbanistText().blackBold(title, 16),
        collapsed: Container(),
        expanded: UrbanistText().blackNormal(body, 14),
        theme: ExpandableThemeData(
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          tapBodyToCollapse: true,
          iconColor: RepoColor().color1,
        ),
      ),
    ),
  );
}
