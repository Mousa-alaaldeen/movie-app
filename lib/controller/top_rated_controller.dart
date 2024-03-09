// ignore_for_file: unnecessary_string_interpolations, avoid_print, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mov/model/model.dart';
import 'package:dio/dio.dart';
import 'package:mov/util/api_url.dart';

class TopRatedBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TopRatedController(), permanent: true);
  }
}

class TopRatedController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getData();
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
        "https://api.themoviedb.org/3/movie/top_rated?api_key=7520ef7694f155dc2802d75ec51b5d4b");
    results = response.data['results'];
    print(response);
    for (var e in results!) {
      list.add(Results.fromJsonObjectModel(e));
    }

    isLoding = false;
    update();
  }
}
