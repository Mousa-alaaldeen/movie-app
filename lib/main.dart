// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mov/controller/layout_controller.dart';
import 'package:mov/controller/top_rated_controller.dart';
import 'package:mov/util/constants.dart';
import 'package:mov/controller/home_controller.dart';
import 'package:mov/view/home_screen.dart';
import 'package:mov/view/layout_screen.dart';
import 'package:mov/view/search_screen.dart';
import 'package:mov/view/top_rated_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: LayoutScreen(),
      initialBinding: LayoutBinding(),
    );
  }
}
