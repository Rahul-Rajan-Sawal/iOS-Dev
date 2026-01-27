import 'package:flutter/material.dart';

class MyUpcomingSchedule extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyUpcomingSchedule();
}

class _MyUpcomingSchedule extends State<MyUpcomingSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
          onPressed: () {},
        ),
        title: Text("Schedules"),
      ),
      body: Column(children: [
        Container(
          color: Colors.amber,
        )
      ]),
    );
  }
}
