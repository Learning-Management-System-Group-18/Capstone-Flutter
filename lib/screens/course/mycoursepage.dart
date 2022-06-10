import 'package:capstone_flutter/widgets/item_tabbar.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/space.dart';

class MyCoursePage extends StatelessWidget {
  const MyCoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UrbanistText().blackBold('My Courses', 24),
              spaceHeight(20),
              _tabSection(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: TabBar(
              unselectedLabelColor: Colors.grey,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: RepoColor().color1,
                    width: 4.0,
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 10.0)),
              tabs: const [
                Tab(
                  child: Text(
                    'Ongoing',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Urbanist'),
                  ),
                ),
                Tab(
                  child: Text(
                    'Lessons',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Urbanist'),
                  ),
                ),
              ]),
        ),
        Container(
          height: 600,
          child: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              ItemOnGoingTabBar(),
              ItemCompletedeTabBar(),
            ],
          ),
        ),
      ],
    ),
  );
}
