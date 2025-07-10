import 'dart:ui';

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

  final icon = [
    "assets/icons/home.png",
    "assets/icons/bed.png",
    "assets/icons/search.png",
    "assets/icons/person.png",
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              IndexedStack(index: index, children: page),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(50),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),

                    child: Container(
                      height: 60,
                      width: size.width - 130,
                      decoration: BoxDecoration(
                        color: Colors.black26,

                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(page.length, (i) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                index = i;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 60,
                              decoration: BoxDecoration(
                                color:
                                    i == index
                                        ? Colors.white
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Image.asset(
                                  icon[i],
                                  scale: 1.5,
                                  color:
                                      i == index ? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
