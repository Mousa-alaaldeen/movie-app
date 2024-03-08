// ignore_for_file: unnecessary_string_interpolations, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mov/model/model.dart';
import 'package:dio/dio.dart';
import 'package:mov/util/api_url.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
  }
}

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getData();
    getupcomingData();
    getNowPlayingData();
    getTVData();
  }

  List<Results> upcomingList = [];
  void getupcomingData() async {
    isLoding = true;
    update();
    var response = await Dio().get("$upcoming");
    results = response.data['results'];
    print(response);
    for (var e in results!) {
      upcomingList.add(Results.fromJsonObjectModel(e));
    }
    isLoding = false;
    update();
  }

//=========================================
  List<Results> nowPlayingList = [];
  void getNowPlayingData() async {
    update();
    var response = await Dio().get("$nowPlaying");
    results = response.data['results'];
    print(response);
    for (var e in results!) {
      nowPlayingList.add(Results.fromJsonObjectModel(e));
    }
    print(nowPlayingList);
    isLoding = false;
    update();
  }

//==========================================
  List<Results> tVList = [];
  List<String> tVImage = [];
  void getTVData() async {
    isLoding = true;
    update();
    var response = await Dio().get("$tV");
    results = response.data['results'];
    print(response);
    for (var e in results!) {
      //https://image.tmdb.org/t/p/w500/${controller.upcomingList[index].posterPath}
      tVImage.add("https://image.tmdb.org/t/p/w500/${e['poster_path']}"   );
      tVList.add(Results.fromJsonObjectModel(e));
    }
    isLoding = false;
    update();
  }

  bool isLoding = false;
  List<Results> list = [];
  late AnimationController animationController;
  late Animation<Offset> animation;

  List<dynamic>? results;
  void getData() async {
    isLoding = true;
    update();
    var response = await Dio().get(
        "https://api.themoviedb.org/3/discover/movie?api_key=7520ef7694f155dc2802d75ec51b5d4b");
    results = response.data['results'];
    // print(response);
    for (var e in results!) {
      list.add(Results.fromJsonObjectModel(e));
    }

    isLoding = false;
    update();
  }

  List<Results> trendingList = [];
  void getTrendingData() async {
    isLoding = true;
    update();
    var response = await Dio().get("$trending");
    results = response.data['results'];
    print(response);
    for (var e in results!) {
      trendingList.add(Results.fromJsonObjectModel(e));
    }

    isLoding = false;
    update();
  }
}
