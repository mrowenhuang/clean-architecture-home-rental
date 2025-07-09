import 'package:clean_architecture_rental_room/features/rental/presentation/pages/home/home_page.dart';
import 'package:clean_architecture_rental_room/features/rental/presentation/pages/profile/profile_page.dart';
import 'package:clean_architecture_rental_room/features/rental/presentation/pages/room/room_page.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';

class IndexRoutePage extends StatelessWidget {
  IndexRoutePage({super.key});

  final page = [const HomePage(), const RoomPage(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[1],

      extendBody: true,
      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: 0,
        onTap: (p0) {},
        backgroundColor: Colors.black26,
        marginR: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
        paddingR: EdgeInsets.symmetric(horizontal: 20),
        items: [
          CrystalNavigationBarItem(
            icon: Icons.home,
            selectedColor: Colors.black,
          ),
          CrystalNavigationBarItem(icon: Icons.home),
          CrystalNavigationBarItem(icon: Icons.home),
          CrystalNavigationBarItem(icon: Icons.home),
        ],
      ),
    );
  }
}
