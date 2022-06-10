import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/screens/home/all_categories_page.dart';
import 'package:capstone_flutter/screens/home/all_course_page.dart';
import 'package:capstone_flutter/widgets/item_listview.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/transition.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../widgets/text.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _searchBoolean = false;
  List<int> _searchIndexList = [];

  List<String> _list = [
    'English Textbook',
    'Japanese Textbook',
    'English Vocabulary',
    'Japanese Vocabulary'
  ];

  Widget _searchListView() {
    return Container(
      height: 300,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: _searchIndexList.length,
        itemBuilder: (context, index) {
          index = _searchIndexList[index];
          return Card(child: ListTile(title: Text(_list[index])));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List kategori = [
      "Category 1",
      "Category 2",
      "Category 3",
      "Category 4",
      "Category 5",
      "Category 6",
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            snap: false,
            backgroundColor: RepoColor().color5,
            expandedHeight: 200,
            centerTitle: false,
            title: UrbanistText().whiteBold('Kursus-in', 20),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.png'),
                      radius: 35,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hi, Nirmala Azalea',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Let's start learning!",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottom: AppBar(
              toolbarHeight: 70,
              elevation: 0.0,
              backgroundColor: RepoColor().color5,
              title: Column(
                children: [
                  Center(
                    child: TextFormField(
                      key: Key('search'),
                      onChanged: (s) {
                        if (s.length <= 0) {
                          setState(() {
                            _searchBoolean = false;
                          });
                        } else if (s.length >= 0) {
                          setState(() {
                            _searchIndexList = [];
                            _searchBoolean = true;
                            for (int i = 0; i < _list.length; i++) {
                              if (_list[i]
                                  .toLowerCase()
                                  .contains(s.toLowerCase())) {
                                _searchIndexList.add(i);
                              }
                            }
                          });
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search_rounded),
                        hintStyle: UrbanistText().styleText(16),
                        hintText: "Search",
                        fillColor: RepoColor().color6,
                        contentPadding: const EdgeInsets.symmetric(vertical: 1),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ],
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Expanded(
                child: !_searchBoolean
                    ? _defaultwidget(kategori: kategori)
                    : _searchListView(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _defaultwidget extends StatelessWidget {
  const _defaultwidget({
    Key? key,
    required this.kategori,
  }) : super(key: key);

  final List kategori;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopMentor(kategori: kategori),
        spaceHeight(10),
        PopularCourses(kategori: kategori),
        spaceHeight(10),
        Categories(kategori: kategori),
      ],
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.kategori,
  }) : super(key: key);

  final List kategori;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UrbanistText().blackBold('Categories', 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  TransisiHalaman(
                    tipe: PageTransitionType.rightToLeftWithFade,
                    page: AllCategoriesPage(),
                  ),
                );
              },
              child: UrbanistText().blackNormal('See All', 18),
            ),
          ],
        ),
        Container(
          height: 150,
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: kategori.length,
            itemBuilder: (context, index) {
              return ItemCategory(
                kategori: kategori[index],
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              childAspectRatio: 2.5,
            ),
          ),
        ),
      ],
    );
  }
}

class PopularCourses extends StatelessWidget {
  const PopularCourses({
    Key? key,
    required this.kategori,
  }) : super(key: key);

  final List kategori;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UrbanistText().blackBold('Popular Courses', 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  TransisiHalaman(
                    tipe: PageTransitionType.rightToLeftWithFade,
                    page: AllCoursePage(),
                  ),
                );
              },
              child: UrbanistText().blackNormal('See All', 18),
            ),
          ],
        ),
        spaceHeight(10),
        Container(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const ItemPopularCourses();
            },
            itemCount: kategori.length,
          ),
        ),
      ],
    );
  }
}

class TopMentor extends StatelessWidget {
  const TopMentor({
    Key? key,
    required this.kategori,
  }) : super(key: key);

  final List kategori;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UrbanistText().blackBold('Top Mentors', 20),
            TextButton(
              onPressed: () {},
              child: UrbanistText().blackNormal('See All', 18),
            ),
          ],
        ),
        spaceHeight(10),
        Container(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              String nama = kategori[index];
              return ItemTopMentor(
                nama: nama,
              );
            },
            itemCount: kategori.length,
          ),
        ),
      ],
    );
  }
}
