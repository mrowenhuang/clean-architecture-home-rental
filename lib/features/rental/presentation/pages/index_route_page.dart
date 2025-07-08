import 'package:clean_architecture_rental_room/features/rental/presentation/pages/home/home_page.dart';
import 'package:clean_architecture_rental_room/features/rental/presentation/pages/profile/profile_page.dart';
import 'package:clean_architecture_rental_room/features/rental/presentation/pages/room/room_page.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

class IndexRoutePage extends StatelessWidget {
  IndexRoutePage({super.key});

  final page = [const HomePage(), const RoomPage(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: page[0],

      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
        currentIndex: 0,
        onTap: (p0) {
          print(p0);
        },
        backgroundColor: Colors.amber,
        enablePaddingAnimation: false,
        items: [
          DotNavigationBarItem(icon: Icon(Icons.home)),
          DotNavigationBarItem(icon: Icon(Icons.search)),
          DotNavigationBarItem(icon: Icon(Icons.search)),
          DotNavigationBarItem(icon: Icon(Icons.search)),
          DotNavigationBarItem(icon: Icon(Icons.search)),
        ],
      ),
    );
  }
}
