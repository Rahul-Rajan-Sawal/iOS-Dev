import 'package:flutter/material.dart';

class MyDashboard extends StatefulWidget {
  
  const MyDashboard({
    Key? key, required String username
  }):super(key: key);
  
  @override
  State<StatefulWidget> createState() => _MyDashboard();
}

class _MyDashboard extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
