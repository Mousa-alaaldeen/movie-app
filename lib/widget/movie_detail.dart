// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mov/util/api_url.dart';
import 'package:mov/util/constants.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({
    super.key,
    required this.movieId,
    required this.imageUrl,
    required this.title,
    required this.year,
    required this.originalTitle,
    required this.overview,
  });
  final String imageUrl;
  final String title;
  final String originalTitle;
  final String year;
  final int movieId;
  final String overview;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Get.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "$baseUrlImag$imageUrl",
                ),
              ),
            ),
            child: SafeArea(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ))
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: kSubheadingextStyle,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      year,
                      style: kSubtitleTextSyule,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      originalTitle,
                      style: kSubtitleTextSyule,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  overview,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
