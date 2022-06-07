// import 'package:capstone_flutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class RepoIcon {
  final Image user1 =
      const Image(image: Svg('assets/icon/User.svg', size: Size(25, 25)));
  final Image user2 =
      const Image(image: Svg('assets/icon/User-1.svg', size: Size(25, 25)));
  final Image email1 =
      const Image(image: Svg('assets/icon/Envelope-1.svg', size: Size(25, 25)));
  final Image email2 =
      const Image(image: Svg('assets/icon/Envelope.svg', size: Size(25, 25)));
  final Image lock =
      const Image(image: Svg('assets/icon/lock.svg', size: Size(25, 25)));

  final Image employee =
      const Image(image: Svg('assets/icon/UsersThree.svg', size: Size(25, 25)));
  final Image employee1 = const Image(
      image: Svg('assets/icon/UsersThree-1.svg', size: Size(25, 25)));
  final Image employee2 = const Image(
    image: Svg('assets/icon/UsersThree-2.svg', size: Size(25, 25)),
    color: Color.fromRGBO(51, 94, 247, 3),
  );

  final Image clock1 = const Image(
    image: Svg('assets/icon/Clock-1.svg', size: Size(25, 25)),
    color: Color.fromRGBO(51, 94, 247, 3),
  );
  final Image clock =
      const Image(image: Svg('assets/icon/Clock.svg', size: Size(25, 25)));

  final Image filetext1 = const Image(
    image: Svg('assets/icon/FileText-1.svg', size: Size(25, 25)),
    color: Color.fromRGBO(51, 94, 247, 3),
  );
  final Image filetext =
      const Image(image: Svg('assets/icon/FileText.svg', size: Size(25, 25)));

  final Image play =
      const Image(image: Svg('assets/icon/PlayCircle.svg', size: Size(25, 25)));

  final Image primaryPlay = const Image(
    image: Svg('assets/icon/PlayCircle.svg', size: Size(25, 25)),
    color: Color.fromRGBO(51, 94, 247, 3),
  );

  final Image arrowCircle = const Image(
    image: Svg('assets/icon/ArrowCircleLeft.svg', size: Size(26, 26)),
    color: Color.fromRGBO(51, 94, 247, 3),
  );
}
