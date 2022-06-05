import 'package:capstone_flutter/widgets/text.dart';
import 'package:flutter/material.dart';

import '../constants/icon.dart';

class ItemLesson extends StatelessWidget {
  final data;
  int? idx;
  ItemLesson({Key? key, this.data, this.idx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.grey[300],
      child: Center(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 17,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey[300],
              child: UrbanistText().blackNormal('${data[idx][0]}', 16),
            ),
          ),
          title: UrbanistText().blackNormal('${data[idx][1]}', 16),
          trailing: RepoIcon().play,
        ),
      ),
    );
  }
}
