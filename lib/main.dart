import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Activitypages/splashscreen_activity.dart';
import 'DBShowingAPI/dbserver.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 👈 ADD

  if (!kReleaseMode) {
    DebugDbServer.start();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true, home: SplashscreenActivity());
  }
}
