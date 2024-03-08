// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mov/model/model.dart';
import 'package:mov/util/constants.dart';

class MovieListWidget extends StatelessWidget {
  final List<Results> moviesList;
  final String text1;
  final String text2;
  const MovieListWidget(
      {Key? key,
      required this.moviesList,
      required this.text1,
      required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: text1,
                  style: TextStyle(
                    color: kRedColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(text: text2, style: kTitleTextStyle),
            ]),
          ),
          SizedBox(
            height: 15,
          ),
          moviesList.isEmpty
              ? CircularProgressIndicator()
              : Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: moviesList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: AspectRatio(
                            aspectRatio: 1 / 1.7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 175,
                                  margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500/${moviesList[index].posterPath}',
                                      ))),
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
                                            moviesList[index].originalTitle ??
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
                ),
        ],
      ),
    );
  }
}
