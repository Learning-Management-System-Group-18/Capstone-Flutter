# Home Page Model 1
// return SafeArea(
    //   child: SingleChildScrollView(
    //     physics: const NeverScrollableScrollPhysics(), //<--here
    //     child: Container(
    //       padding: const EdgeInsets.all(25),
    //       child: Column(
    //         children: [
    //           SizedBox(
    //             child: Row(
    //               children: [
    //                 const CircleAvatar(
    //                   backgroundImage: NetworkImage(
    //                       'https://cdn.icon-icons.com/icons2/2643/PNG/512/male_boy_person_people_avatar_icon_159358.png'),
    //                   backgroundColor: Colors.transparent,
    //                   radius: 35,
    //                 ),
    //                 const SizedBox(
    //                   width: 20,
    //                 ),
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     customText(
    //                       text: 'Welcome',
    //                       size: 16,
    //                       weight: FontWeight.normal,
    //                     ),
    //                     customText(
    //                       text: 'Nirmala Azalea',
    //                       size: 18,
    //                       weight: FontWeight.bold,
    //                     ),
    //                   ],
    //                 )
    //               ],
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           SizedBox(
    //             child: TextFormField(
    //               key: Key('search'),
    //               style: const TextStyle(
    //                 fontSize: 16,
    //               ),
    //               decoration: InputDecoration(
    //                 prefixIcon: const Icon(Icons.search_rounded),
    //                 hintStyle: customTextStyle(size: 16),
    //                 hintText: "Search",
    //                 focusColor: Colors.amber.shade300,
    //                 prefixIconColor: Colors.amber.shade300,
    //                 filled: true,
    //                 isDense: true,
    //                 border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10),
    //                     borderSide: BorderSide.none),
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           SizedBox(
    //             child: Column(
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     customText(
    //                         text: 'Most Popular Courses',
    //                         size: 18,
    //                         weight: FontWeight.bold),
    //                     TextButton(
    //                       onPressed: () {},
    //                       child: customText(
    //                           text: 'See All',
    //                           size: 18,
    //                           weight: FontWeight.bold),
    //                     ),
    //                   ],
    //                 ),
    //                 SizedBox(
    //                   height: 10,
    //                 ),
    //                 Container(
    //                   height: 55,
    //                   child: ListView.builder(
    //                     scrollDirection: Axis.horizontal,
    //                     itemBuilder: (context, index) {
    //                       return Card(
    //                         shape: RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(10),
    //                           side: BorderSide(
    //                               color: Colors.amber.shade300, width: 1.5),
    //                         ),
    //                         elevation: 0.0,
    //                         child: Padding(
    //                           padding: const EdgeInsets.all(15.0),
    //                           child: customText(
    //                             text: kategori[index],
    //                             size: 14,
    //                             weight: FontWeight.normal,
    //                           ),
    //                         ),
    //                       );
    //                     },
    //                     itemCount: kategori.length,
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           Container(
    //             height: 355,
    //             child: ListView.builder(
    //               itemBuilder: (context, index) {
    //                 return Card(
    //                   shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(20),
    //                     side: BorderSide(
    //                         color: Colors.amber.shade300, width: 1.5),
    //                   ),
    //                   elevation: 0.0,
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(20.0),
    //                     child: Row(
    //                       children: [
    //                         Container(
    //                           height: 100,
    //                           width: 100,
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(10),
    //                             image: const DecorationImage(
    //                               image: NetworkImage(
    //                                   'https://www.cdmi.in/courses@2x/flutter-training-institute.jpg'),
    //                               fit: BoxFit.cover,
    //                             ),
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           width: 10,
    //                         ),
    //                         Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             customText(
    //                               text: 'Office Productifity',
    //                               size: 18,
    //                               weight: FontWeight.bold,
    //                             ),
    //                             const SizedBox(
    //                               height: 10,
    //                             ),
    //                             Row(
    //                               children: [
    //                                 Icon(Icons.star, color: Colors.amber[400]),
    //                                 customText(
    //                                   text: '4.8 (230 reviews)',
    //                                   size: 14,
    //                                   weight: FontWeight.normal,
    //                                 ),
    //                               ],
    //                             ),
    //                             Row(
    //                               children: [
    //                                 Icon(Icons.person, color: Colors.blue),
    //                                 customText(
    //                                   text: '56 employees',
    //                                   size: 14,
    //                                   weight: FontWeight.normal,
    //                                 ),
    //                               ],
    //                             ),
    //                           ],
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                 );
    //               },
    //               itemCount: kategori.length,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

## Home Page Model 2

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

## Home Page Model 3
final ScrollController _scrollController = ScrollController();
    return FadeScrollAppBar(
      scrollController: _scrollController,
      appBarTitle: UrbanistText().whiteBold('Kursus-in', 20),
      pinned: true,
      fadeOffset: 100,
      expandedHeight: 210,
      backgroundColor: RepoColor().color5,
      fadeWidget: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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

## Detail course
//   return Scaffold(
    //     extendBodyBehindAppBar: true,
    //     appBar: AppBar(
    //       leading: Padding(
    //         padding: const EdgeInsets.all(8),
    //         child: CircleAvatar(
    //           backgroundColor: RepoColor().color2,
    //           radius: 10,
    //           child: IconButton(
    //             onPressed: () {},
    //             icon: Icon(
    //               Icons.arrow_back,
    //               color: Colors.white,
    //             ),
    //           ),
    //         ),
    //       ),
    //       backgroundColor: Colors.transparent,
    //       elevation: 0.0,
    //       iconTheme: IconThemeData(color: Colors.black),
    //     ),
    //     body: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           Container(
    //             height: 250,
    //             width: double.infinity,
    //             decoration: const BoxDecoration(
    //               image: DecorationImage(
    //                 image: NetworkImage(
    //                   'https://www.cdmi.in/courses@2x/flutter-training-institute.jpg',
    //                 ),
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //           ),
    //           Container(
    //             padding: const EdgeInsets.all(20),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 UrbanistText().blackBold('Office Productifity', 24),
    //                 spaceHeight(10),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Row(
    //                       children: [
    //                         const Icon(
    //                           Icons.people,
    //                           color: Colors.blue,
    //                         ),
    //                         spaceWidth(10),
    //                         UrbanistText().blackNormal('56 employees', 16),
    //                       ],
    //                     ),
    //                     Row(
    //                       children: [
    //                         const Icon(
    //                           Icons.star,
    //                           color: Colors.amber,
    //                         ),
    //                         spaceWidth(10),
    //                         UrbanistText().blackNormal('4.8 (230 reviews)', 16),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //                 spaceHeight(10),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Row(
    //                       children: [
    //                         const Icon(
    //                           Icons.access_time_outlined,
    //                           color: Colors.green,
    //                         ),
    //                         spaceWidth(10),
    //                         UrbanistText().blackNormal('2,5 Hours', 16),
    //                       ],
    //                     ),
    //                     Row(
    //                       children: [
    //                         const Icon(
    //                           Icons.check,
    //                           color: Colors.indigo,
    //                         ),
    //                         spaceWidth(10),
    //                         UrbanistText().blackNormal('Certificate', 16),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //                 spaceHeight(10),
    //                 const Divider(
    //                   height: 5,
    //                 ),
    //                 _tabSection(context),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     bottomNavigationBar: Container(
    //       height: 100,
    //       padding: const EdgeInsets.all(20),
    //       decoration: BoxDecoration(
    //         borderRadius: const BorderRadius.only(
    //           topLeft: Radius.circular(30),
    //           topRight: Radius.circular(30),
    //         ),
    //       ),
    //       child: ElevatedButton(
    //         onPressed: () {},
    //         child: UrbanistText().blackBold("Enroll Courses", 16),
    //         style: ElevatedButton.styleFrom(
    //           elevation: 10,
    //           primary: Colors.grey[300],
    //           minimumSize: const Size.fromHeight(56),
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(25.0),
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // }


## Item di ListView File


//Ini item section Ketika Item On Going Di Klik
// class ItemLessonCourseOnGoing extends StatelessWidget {
//   final data;
//   int? idx;
//   var setIcon;
//   ItemLessonCourseOnGoing({Key? key, this.data, this.idx, this.setIcon})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     int no = 1;
//     for (var i = 1; i <= idx!; i++) {
//       no++;
//     }
//     var trailIcon = RepoIcon().primaryPlay;
//     return InkWell(
//       onTap: () {
//         // Navigator.push(
//         //   context,
//         //   TransisiHalaman(
//         //     tipe: PageTransitionType.rightToLeftWithFade,
//         //     page: LessonPage(
//         //       section: section,
//         //       lesson: data[idx][1],
//         //       no: data[idx][0],
//         //     ),
//         //   ),
//         // );
//       },
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//           side: BorderSide(color: RepoColor().color1),
//         ),
//         elevation: 0,
//         child: Center(
//           child: ListTile(
//             leading: CircleAvatar(
//               radius: 16,
//               backgroundColor: RepoColor().color4,
//               child: UrbanistText().primaryNormal('0${no}', 16),
//             ),
//             title: UrbanistText().blackNormal('${data.title}', 16),
//             trailing: trailIcon,
//           ),
//         ),
//       ),
//     );
//   }
// }



## Item Grid di ListView


// class ItemGridAllCourse extends StatelessWidget {
//   final m_course.Data data;
//   ItemGridAllCourse({Key? key, required this.data}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // Navigator.push(context,
//         // MaterialPageRoute(builder: (context) => DetailCoursePage()));
//       },
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         elevation: 2,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 121,
//                 width: 150,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   image: DecorationImage(
//                     image: NetworkImage(data.urlImage.toString()),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               spaceHeight(15),
//               UrbanistText().blackBold('${data.title}', 18),
//               spaceHeight(8),
//               Row(
//                 children: [
//                   Icon(Icons.star, color: Colors.amber[400]),
//                   UrbanistText().blackNormal('${data.rating} rating', 14)
//                 ],
//               ),
//               spaceHeight(5),
//               Row(
//                 children: [
//                   // Icon(Icons.person, color: Colors.blue),
//                   UrbanistText().blackNormal('${data.description}', 14)
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }