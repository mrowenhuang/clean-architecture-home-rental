import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 5),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              "Search : Building or Street",
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
                      backgroundImage: AssetImage('assets/logo/tinggal.jpg'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Stack(
                  children: [
                    Container(
                      height: 250,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            spreadRadius: -5,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Expanded(child: Container(color: Colors.red)),
                                SizedBox(height: 10),
                                Expanded(child: Container(color: Colors.red)),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(child: Container(color: Colors.blue)),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,

                      child: Container(color: Colors.black26, height: 50),
                    ),
                  ],
                ),
              );
            }, childCount: 5),
          ),
        ],
      ),
    );
  }
}
