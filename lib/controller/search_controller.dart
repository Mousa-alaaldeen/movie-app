// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchControllerr(), permanent: true);
  }
}

class SearchControllerr extends GetxController {
  // final TextEditingController SearchC = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }
}
