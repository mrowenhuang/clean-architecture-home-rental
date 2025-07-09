import 'package:clean_architecture_rental_room/features/rental/presentation/pages/home/home_page.dart';
import 'package:clean_architecture_rental_room/features/rental/presentation/pages/profile/profile_page.dart';
import 'package:clean_architecture_rental_room/features/rental/presentation/pages/room/room_page.dart';
import 'package:clean_architecture_rental_room/features/rental/presentation/pages/search/search_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

class IndexRoutePage extends StatefulWidget {
  const IndexRoutePage({super.key});

  @override
  State<IndexRoutePage> createState() => _IndexRoutePageState();
}

class _IndexRoutePageState extends State<IndexRoutePage> {
  final page = [
    const HomePage(),
    const RoomPage(),
    const SearchPage(),
    const ProfilePage(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          page[0],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              width: size.width - 130,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    page
                        .map(
                          (e) => IconButton(
                            icon: Icon(Icons.abc),
                            onPressed: () {},
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
