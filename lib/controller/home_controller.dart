// ignore_for_file: unnecessary_string_interpolations, avoid_print, depend_on_referenced_packages, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mov/model/model.dart';
import 'package:dio/dio.dart';
import 'package:mov/util/api_url.dart';
import 'dart:convert';
import 'package:mov/util/constants.dart';
import 'package:mov/util/error_dialog.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
  }
}

class HomeController extends GetxController {
  late AnimationController animationController;
  late Animation<Offset> animation;
  List<dynamic>? results;
  List<Results> list = [];
  List<Results> nowPlayingList = [];
  List<Results> upcomingList = [];
  List<Results> tVList = [];
  List<String> tVImage = [];
  List<String> favoriteList = [];
  List<Results> trendingList = [];
  List<Record> ratedMovies = [];

  @override
  void onInit() {
    super.onInit();
    getData();
    getupcomingData();
    getNowPlayingData();
    getTVData();
  }

  void getupcomingData() async {
    var response = await Dio().get("$upcoming");
    results = response.data['results'];

    for (var e in results!) {
      upcomingList.add(Results.fromJsonObjectModel(e));
    }
  }
//=========================================

  void getNowPlayingData() async {
    var response = await Dio().get("$nowPlaying");
    results = response.data['results'];
    // print("Status Code: ${response.statusCode}");

    for (var e in results!) {
      nowPlayingList.add(Results.fromJsonObjectModel(e));
    }
    print(nowPlayingList);
  }

//==========================================
  void getTVData() async {
    var response = await Dio().get("$tV");
    results = response.data['results'];
    for (var e in results!) {
      //https://image.tmdb.org/t/p/w500/${controller.upcomingList[index].posterPath}
      tVImage.add("https://image.tmdb.org/t/p/w500/${e['poster_path']}");
      tVList.add(Results.fromJsonObjectModel(e));
    }
  }

  void getData() {
    update();
    Dio()
        .get(
      "https://api.themoviedb.org/3/discover/movie?api_key=7520ef7694f155dc2802d75ec51b5d4b",
    )
        .then((response) {
      print('sucsses');

      results = response.data['results'];
      for (var e in results!) {
        list.add(Results.fromJsonObjectModel(e));
      }

      update();
    }).catchError((onError) {
      Get.dialog(ErrorDialogWidget());
    });
  }

  void getTrendingData() async {
    update();
    var response = await Dio().get("$trending");
    results = response.data['results'];

    for (var e in results!) {
      trendingList.add(Results.fromJsonObjectModel(e));
    }

    update();
  }

  Future setFavorite(
      {required int mediaId,
      required bool favorite,
      required String mediaType}) async {
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

      update();
    }).catchError((onError) {
      print(onError);
    });
  }

  Future setRate({required int movieId, required double value}) async {
    update();

    final jsonData = json.encode({'value': value});

    return await Dio()
        .post(
      '${baseUrl}movie/$movieId/rating',
      data: jsonData,
      options: Options(
        headers: {
          'Authorization': ' Bearer $token',
          'Content-Type': 'application/json;charset=utf-',
          'accept': 'application/json',
        },
      ),
    )
        .then((value) {
      print('sucsses');

      update();
    }).catchError((onError) {
      print(onError);
      // Get.defaultDialog(
      //   title: 'ata qga;lsd',
      //   onConfirm: () {},
      // );
    });
  }

  Future deleteRate({
    required int movieId,
  }) async {
    update();

    return await Dio()
        .delete('${baseUrl}movie/$movieId/rating',
            options: Options(headers: {
              'Authorization': ' Bearer $token',
              'Content-Type': 'application/json;charset=utf-',
              'accept': 'application/json',
            }))
        .then((value) {
      print('sucsses');

      update();
    }).catchError((onError) {
      print(onError);
    });
  }
}
