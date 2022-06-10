import 'dart:async';

import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/screens/course/mycoursepage.dart';
import 'package:capstone_flutter/screens/home/homepage.dart';
import 'package:capstone_flutter/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage>
    with TickerProviderStateMixin {
  // TabController? _tabController;

  // @override
  // void initState() {
  //   super.initState();

  //   refresh();
  //   _tabController = TabController(
  //     initialIndex: 0,
  //     length: 3,
  //     vsync: this,
  //   );
  // }

  // FutureOr refresh() {
  //   setState(() {});
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _tabController!.dispose();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: TabBarView(
  //         controller: _tabController,
  //         physics: NeverScrollableScrollPhysics(),
  //         children: <Widget>[
  //           Homepage(),
  //           Mycoursepage(),
  //           Profilepage(),
  //         ],
  //       ),
  //     ),
  //     bottomNavigationBar: MotionTabBar(
  //       initialSelectedTab: "Home",
  //       labels: const ["Home", "MyCourse", "Profile"],
  //       icons: const [Icons.home, Icons.dashboard, Icons.people_alt],
  //       tabSize: 45,
  //       tabBarHeight: 50,
  //       textStyle: const TextStyle(
  //         fontSize: 12,
  //         color: Colors.black,
  //         fontWeight: FontWeight.w500,
  //       ),
  //       tabIconColor: Colors.blue,
  //       tabIconSize: 28.0,
  //       tabIconSelectedSize: 26.0,
  //       tabSelectedColor: Colors.blue,
  //       tabIconSelectedColor: Colors.white,
  //       tabBarColor: Colors.white,
  //       onTabItemSelected: (int value) {
  //         setState(() {
  //           _tabController!.index = value;
  //         });
  //       },
  //     ),
  //   );

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    MyCoursePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: RepoColor().color2,
        onTap: _onItemTapped,
      ),
    );
  }
}
