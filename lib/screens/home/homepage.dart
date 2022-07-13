import 'package:capstone_flutter/api/course_repository.dart';
import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/constants/state.dart';
import 'package:capstone_flutter/models/course_model.dart' as m_course;
import 'package:capstone_flutter/screens/home/all_categories_page.dart';
import 'package:capstone_flutter/screens/home/all_course_page.dart';
import 'package:capstone_flutter/screens/home/all_mentor_page.dart';
import 'package:capstone_flutter/widgets/item_listview.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/HomeController.dart';
import '../../widgets/text.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _searchBoolean = false;
  String? value;
  Widget _searchListView(String value) {
    print('value : $value');
    return FutureBuilder<List<m_course.Data>?>(
      future: CourseRepository().postSearchCourse(value),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final data = snapshot.data?[index];
                return ItemAllCourse(data: data!);
              },
            );
          } else {
            return Center(
              child: UrbanistText().blackNormal('Data not found!', 14),
            );
          }
        } else {
          return Center(
            child: UrbanistText().blackNormal('Plese wait...', 14),
          );
        }
      },
    );
  }

  Widget _defaultwidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Categories(),
        // TopMentor(kategori: kategori),
        spaceHeight(10),
        const PopularCourses(),
        spaceHeight(50),
      ],
    );
  }

  String? fullName;
  String? token;
  getDataPref() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullName');
      token = prefs.getString('token');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataPref();
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<HomeController>(context, listen: false).getDataCategories();
      });
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<HomeController>(context, listen: false).getDataAllCourse();
      });
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<HomeController>(context, listen: false).getAllDataUser();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    String? imageUrl = homeController.dataProfileUser?.urlImage;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          Provider.of<HomeController>(context, listen: false)
              .getDataCategories();
          Provider.of<HomeController>(context, listen: false)
              .getDataAllCoursePopular();
          Provider.of<HomeController>(context, listen: false).getAllDataUser();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: false,
              pinned: true,
              snap: false,
              backgroundColor: RepoColor().color5,
              expandedHeight: 200,
              centerTitle: false,
              title: const Image(
                image: Svg('assets/images/titleApp.svg', size: Size(80, 80)),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          if (imageUrl == null) ...[
                            const CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/images/profile.png')),
                          ] else ...[
                            CircleAvatar(
                                radius: 20.0,
                                backgroundImage: Image.network(
                                  imageUrl,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ).image),
                          ],
                          spaceWidth(10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UrbanistText().whiteBold(
                                  "Hi, ${fullName ?? 'Welcome'}", 18),
                              UrbanistText()
                                  .whiteNormal("Let's start learning!", 14),
                            ],
                          ),
                        ],
                      ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: const Icon(
                      //     Icons.notifications_active,
                      //     color: Colors.white,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              bottom: AppBar(
                toolbarHeight: 80,
                elevation: 0.0,
                backgroundColor: RepoColor().color5,
                title: Column(
                  children: [
                    Center(
                      child: TextFormField(
                        key: Key('search'),
                        onChanged: (s) {
                          this.value = s;
                          if (s.length <= 0) {
                            setState(() {
                              _searchBoolean = false;
                            });
                          } else if (s.length >= 0) {
                            setState(() {
                              _searchBoolean = true;
                              value = s;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search_rounded),
                          hintStyle: UrbanistText().styleText(16),
                          hintText: "Search",
                          fillColor: RepoColor().color6,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 1),
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
              child: Consumer<HomeController>(
                builder: (BuildContext context, HomeController controller,
                    Widget? child) {
                  if (controller.dataState == DataState.loading) {
                    return Center(
                      heightFactor: MediaQuery.of(context).size.height * 0.015,
                      child: const CircularProgressIndicator(),
                    );
                  }
                  if (controller.dataState == DataState.error) {
                    return Center(
                      child:
                          UrbanistText().blackBold('Something went wrong!', 14),
                    );
                  }
                  return Container(
                    padding: const EdgeInsets.all(15.0),
                    child: !_searchBoolean
                        ? _defaultwidget()
                        : _searchListView(value!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UrbanistText().blackBold('Categories', 20),
            // TextButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       TransisiHalaman(
            //         tipe: PageTransitionType.rightToLeftWithFade,
            //         page: AllCategoriesPage(),
            //       ),
            //     );
            //   },
            //   child: UrbanistText().blackNormal('See All', 18),
            // ),
          ],
        ),
        spaceHeight(12),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: homeController.categories.length,
          itemBuilder: (context, index) {
            final category = homeController.dataCategory[index];
            return ItemCategory(data: category);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            childAspectRatio: 2.8,
          ),
        ),
      ],
    );
  }
}

class PopularCourses extends StatelessWidget {
  const PopularCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
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
        SizedBox(
          height: 325,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final course = homeController.coursesPopular[index];
              return ItemPopularCourses(
                data: course,
              );
            },
            itemCount: homeController.coursesPopular.length,
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
              onPressed: () {
                Navigator.push(
                  context,
                  TransisiHalaman(
                    tipe: PageTransitionType.rightToLeftWithFade,
                    page: AllMentorPage(),
                  ),
                );
              },
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
