import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/widgets/item_listview.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:fade_scroll_app_bar/fade_scroll_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/text.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List kategori = [
      "All",
      "Category 1",
      "Category 2",
      "Category 3",
      "Category 4",
      "Category 5",
      "Category 6",
    ];

    //   return Scaffold(
    //     body: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           Container(
    //             height: 204,
    //             width: double.infinity,
    //             decoration: const BoxDecoration(
    //               color: Colors.blue,
    //               borderRadius: BorderRadius.only(
    //                 bottomLeft: Radius.circular(30),
    //                 bottomRight: Radius.circular(30),
    //               ),
    //             ),
    //             padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
    //             child: SafeArea(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Row(
    //                     children: [
    //                       const CircleAvatar(
    //                         backgroundImage: NetworkImage(
    //                             'https://i.pinimg.com/originals/d3/f9/13/d3f913b8dd27fac04b26c2c9a903610d.png'),
    //                         radius: 35,
    //                       ),
    //                       const SizedBox(
    //                         width: 12,
    //                       ),
    //                       Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: const [
    //                           Text(
    //                             'Hi, Nirmala Azalea',
    //                             style: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white,
    //                             ),
    //                           ),
    //                           Text(
    //                             "Let's start learning!",
    //                             style: TextStyle(
    //                               fontSize: 14,
    //                               color: Colors.white,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                   const SizedBox(
    //                     height: 15,
    //                   ),
    //                   SizedBox(
    //                     child: TextFormField(
    //                       key: Key('search'),
    //                       decoration: InputDecoration(
    //                         prefixIcon: const Icon(Icons.search_rounded),
    //                         hintStyle: UrbanistText().styleText(16),
    //                         hintText: "Search",
    //                         fillColor: Colors.blue[200],
    //                         contentPadding:
    //                             const EdgeInsets.symmetric(vertical: 1),
    //                         filled: true,
    //                         border: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(20),
    //                             borderSide: BorderSide.none),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Container(
    //             padding: const EdgeInsets.all(15),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 TopMentor(kategori: kategori),
    //                 spaceHeight(10),
    //                 PopularCourses(kategori: kategori),
    //                 spaceHeight(10),
    //                 Categories(kategori: kategori),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }
    final ScrollController _scrollController = ScrollController();
    return FadeScrollAppBar(
      scrollController: _scrollController,
      appBarTitle: UrbanistText().whiteBold('Kursus-in', 20),
      pinned: true,
      fadeOffset: 100,
      expandedHeight: 210,
      backgroundColor: RepoColor().color1,
      fadeWidget: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/d3/f9/13/d3f913b8dd27fac04b26c2c9a903610d.png'),
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
          ],
        ),
      ),
      bottomWidgetHeight: 40,
      bottomWidget: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
        child: TextFormField(
          key: Key('search'),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search_rounded),
            hintStyle: UrbanistText().styleText(16),
            hintText: "Search",
            fillColor: Colors.blue[200],
            contentPadding: const EdgeInsets.symmetric(vertical: 1),
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none),
          ),
        ),
      ),
      appBarShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopMentor(kategori: kategori),
              spaceHeight(10),
              PopularCourses(kategori: kategori),
              spaceHeight(10),
              Categories(kategori: kategori),
            ],
          ),
        ),
      ),
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
              onPressed: () {},
              child: UrbanistText().blackNormal('See All', 18),
            ),
          ],
        ),
        Container(
          height: 230,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: kategori.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: Center(
                  child: UrbanistText().blackNormal(kategori[index], 16),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
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
              onPressed: () {},
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
              return ItemPopularCourses();
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
