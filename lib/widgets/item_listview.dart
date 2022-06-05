import 'package:capstone_flutter/screens/home/detailcoursepage.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:flutter/material.dart';

class ItemTopMentor extends StatelessWidget {
  String? nama;
  ItemTopMentor({
    Key? key,
    this.nama,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 20,
          ),
          UrbanistText().blackNormal(nama ?? '', 14),
        ],
      ),
    );
  }
}

class ItemPopularCourses extends StatelessWidget {
  const ItemPopularCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailCoursePage()));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 136,
          width: 208,
          child: Column(
            children: [
              spaceHeight(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://www.cdmi.in/courses@2x/flutter-training-institute.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  spaceHeight(10),
                  UrbanistText().blackBold('Office Productifity', 18),
                  spaceHeight(10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber[400]),
                      UrbanistText().blackNormal('4.8 (230 reviews)', 14)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.blue),
                      UrbanistText().blackNormal('56 Employees', 14)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
