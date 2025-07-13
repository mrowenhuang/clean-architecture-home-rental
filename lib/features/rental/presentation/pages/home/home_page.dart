import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
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
                          Text("Search", style: TextStyle(fontSize: 14)),
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
                    backgroundImage: AssetImage('assets/logo/tinggal.jpg'),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Building", style: TextStyle(fontSize: 20)),
                SizedBox(width: 5),
                Image.asset("assets/icons/building.png", scale: 1.6),
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
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: size.height * .4,

              // child: ListView.builder(
              //   itemCount: 5,

              //   scrollDirection: Axis.horizontal,
              //   itemBuilder: (context, index) {
              // return Padding(
              //   padding: const EdgeInsets.only(right: 10),
              //   child: Container(
              //     width: 250,
              //     padding: EdgeInsets.all(20),
              //     decoration: BoxDecoration(
              //       color: Colors.red,
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     alignment: Alignment.bottomCenter,
              //     child: Container(
              //       width: 200,
              //       height: 70,
              //       decoration: BoxDecoration(
              //         color: Colors.amber,
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //     ),
              //   ),
              //     );
              //   },
              // ),
              child: CarouselSlider.builder(
                itemCount: 5,

                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 250,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  viewportFraction: .6,
                  initialPage: 0,
                  scrollDirection: Axis.horizontal,
                  animateToClosest: true,
                  disableCenter: true,
                  enlargeCenterPage: true,
                  
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 400,
              child: GridView.custom(
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,

                  pattern: [
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 2),
                    QuiltedGridTile(1, 2),
                  ],
                ),

                childrenDelegate: SliverChildBuilderDelegate((context, index) {
                  return Stack(
                    children: [
                      Container(color: Colors.blue),

                      Container(color: Colors.black26),
                      Positioned(
                        bottom: 10,
                        right: 20,
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Hello world",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  );
                }, childCount: 9),
              ),
            ),
          ),

          // ElevatedButton(
          //   onPressed: () {
          //     context.read<AuthBloc>().add(SignoutAuthEvent());
          //   },
          //   child: Text("log out"),
          // ),
          // SizedBox(height: 20),
          // SizedBox(
          //   height: 400,
          //   child:
          // ),
        ],
      ),
    );
  }
}
