import 'package:flutter/material.dart';
import 'Activitypages/login.dart';
import 'Activitypages/splashscreen_activity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashscreenActivity()
    );
  }
}
