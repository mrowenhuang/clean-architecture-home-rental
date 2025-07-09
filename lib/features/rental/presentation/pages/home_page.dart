import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                SizedBox(width: 10),
                                Text("Medan", style: TextStyle(fontSize: 16)),
                              ],
                            ),
                            SizedBox(height: 15),
                            Container(
                              width: size.width - 120,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 4,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.search),
                                  SizedBox(width: 10),
                                  Text(
                                    "Search",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(100),
                          child: CircleAvatar(
                            maxRadius: 30,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                              'assets/logo/tinggal.jpg',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Building", style: TextStyle(fontSize: 20)),
                        SizedBox(width: 5),
                        Icon(Icons.home_filled),
                        Spacer(),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Icon(Icons.date_range_outlined),
                          label: Text(
                            "Book An Appointment",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: size.height * .4,

                      child: ListView.builder(
                        itemCount: 5,

                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 250,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     context.read<AuthBloc>().add(SignoutAuthEvent());
                //   },
                //   child: Text("log out"),
                // ),
                Expanded(
                  child: GridView.custom(
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 4,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        QuiltedGridTile(3, 1),
                        QuiltedGridTile(1, 2),
                        QuiltedGridTile(1, 2),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate((
                      context,
                      index,
                    ) {
                      return Container(height: 400, color: Colors.blue);
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
