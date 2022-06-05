import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/AuthController.dart';
import 'screens/splashscreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    ),
  );
}
