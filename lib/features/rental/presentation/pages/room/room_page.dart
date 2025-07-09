import 'package:flutter/material.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Column(
        children: [
          Container(height: 200, color: Colors.red),
          SizedBox(height: 20),
          Container(height: 200, color: Colors.green),
          SizedBox(height: 20),
          Container(height: 200, color: Colors.amber),
        ],
      ),
    );
  }
}
