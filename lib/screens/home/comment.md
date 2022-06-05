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