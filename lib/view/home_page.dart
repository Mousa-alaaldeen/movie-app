// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mov/util/api_url.dart';
import 'package:mov/util/constants.dart';

import 'package:mov/controller/home_controller.dart';

import 'package:get/get.dart';
import 'package:mov/view/search_screen.dart';
import 'package:mov/widget/MovieListWidget.dart';
import 'package:mov/widget/custom_carousel_slider.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: IconButton(
              onPressed: () {
                Get.to(
                  () => const SearchScreen(),
                );
              },
              icon: Icon(Icons.search)),
        ),
        body: GetBuilder<HomeController>(builder: (_) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                CustomCarouselSlider(),
                MovieListWidget(
                  moviesList: controller.nowPlayingList,
                  text1: 'N',
                  text2: 'ow playing',
                ),
                MovieListWidget(
                  moviesList: controller.upcomingList,
                  text1: 'U',
                  text2: 'pcoming Movie',
                ),
                // SizedBox(
                //   height: 220,
                //   child: MovieCard(),
                // ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "P",
                        style: TextStyle(
                          color: kRedColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(text: "opular", style: kTitleTextStyle),
                  ]),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.list.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: AspectRatio(
                          aspectRatio: 1 / 1.5,
                          child: GestureDetector(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 180,
                                  margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500/${controller.list[index].posterPath}'))),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        stops: [0.2, 0.9],
                                        colors: [
                                          Colors.black.withOpacity(0.9),
                                          Colors.black.withOpacity(0.3),
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                          Text(
                                            controller.list[index]
                                                    .originalTitle ??
                                                "",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                // progressBar(),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => MovieScreen()),
                          // );
                        },
                      );
                    },
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "T",
                        style: TextStyle(
                          color: kRedColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(text: "rending", style: kTitleTextStyle),
                  ]),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.trendingList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: AspectRatio(
                          aspectRatio: 1 / 1.5,
                          child: GestureDetector(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 180,
                                  margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '${baseUrlImag}${controller.trendingList[index].posterPath}'))),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        stops: [0.2, 0.9],
                                        colors: [
                                          Colors.black.withOpacity(0.9),
                                          Colors.black.withOpacity(0.3),
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                          Text(
                                            controller.list[index]
                                                    .originalTitle ??
                                                "",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                // progressBar(),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => MovieScreen()),
                          // );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.trendingList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: AspectRatio(
                          aspectRatio: 1 / 1.5,
                          child: GestureDetector(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 180,
                                  margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '${baseUrlImag}${controller.trendingList[index].posterPath}'))),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        stops: [0.2, 0.9],
                                        colors: [
                                          Colors.black.withOpacity(0.9),
                                          Colors.black.withOpacity(0.3),
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                          Text(
                                            controller.list[index]
                                                    .originalTitle ??
                                                "",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                // progressBar(),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => MovieScreen()),
                          // );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
