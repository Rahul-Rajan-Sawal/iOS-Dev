import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class MyDashboard extends StatefulWidget {
   final String username; 

  const MyDashboard({
    super.key,
    required this.username,
  });
  
  @override
  State<MyDashboard> createState() => _MyNewPageState();
}

class _MyNewPageState extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welome to Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
              'Hello ${widget.username}!',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

