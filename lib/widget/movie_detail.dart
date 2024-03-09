// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mov/util/api_url.dart';
import 'package:mov/util/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({
    super.key,
    required this.movieId,
    required this.imageUrl,
    required this.title,
    required this.year,
    required this.originalTitle,
    required this.overview,
    required this.onRatingUpdate,
    this.deleteRate,
    this.initialRating,
  });
  final String imageUrl;
  final String title;
  final String originalTitle;
  final String year;
  final int movieId;
  final double? initialRating;
  final String overview;
  final void Function(double) onRatingUpdate;
  final Function()? deleteRate;

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
          Center(
            child: RatingBar.builder(
                initialRating: initialRating ?? 0,
                minRating: 0.5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 8,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                onRatingUpdate: onRatingUpdate),
          ),
          Center(
            child: ElevatedButton(
              onPressed: deleteRate,
              child: Text("Delete rating"),
            ),
          ),
        ],
      ),
    );
  }
}
