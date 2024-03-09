// ignore_for_file: unnecessary_string_interpolations, avoid_print, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mov/model/model.dart';
import 'package:dio/dio.dart';
import 'package:mov/util/api_url.dart';
import 'package:mov/util/constants.dart';

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
    // print("Status Code: ${response.statusCode}");

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

    for (var e in results!) {
      //https://image.tmdb.org/t/p/w500/${controller.upcomingList[index].posterPath}
      tVImage.add("https://image.tmdb.org/t/p/w500/${e['poster_path']}");
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

    for (var e in results!) {
      trendingList.add(Results.fromJsonObjectModel(e));
    }

    isLoding = false;
    update();
  }

  Future setFavorite(
      {required int mediaId,
      required bool favorite,
      required String mediaType}) async {
    isLoding = true;
    update();

    return await Dio()
        .post('${baseUrl}account/21073642/favorite',
            data: {
              "media_type": mediaType,
              "media_id": mediaId,
              "favorite": favorite
            },
            options: Options(headers: {
              'Authorization': ' Bearer $token',
              'accept': 'application/json',
              'content-type': 'application/json',
            }))
        .then((value) {
      print('sucsses');
      isLoding = false;
      update();
    }).catchError((onError) {
      print(onError);
    });
  }

  Future setRate({required int movieId, required double value}) async {
    isLoding = true;
    update();

    return await Dio()
        .post('${baseUrl}movie/$movieId/rating',
            data: {'{"value":$value}'},
            options: Options(headers: {
              'Authorization': ' Bearer $token',
              'Content-Type': 'application/json;charset=utf-',
              'accept': 'application/json',
            }))
        .then((value) {
      print('sucsses');
      isLoding = false;
      update();
    }).catchError((onError) {
      print(onError);
      Get.defaultDialog(
        title: 'ata qga;lsd',
        onConfirm: () {},
      );
    });
  }

  Future deleteRate({required int movieId}) async {
    isLoding = true;
    update();

    return await Dio()
        .post('${baseUrl}movie/$movieId/rating',
            options: Options(headers: {
              'Authorization': ' Bearer $token',
              'Content-Type': 'application/json;charset=utf-',
              'accept': 'application/json',
            }))
        .then((value) {
      print('sucsses');
      isLoding = false;
      update();
    }).catchError((onError) {
      print(onError);
    });
  }
}
