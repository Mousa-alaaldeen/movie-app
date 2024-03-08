// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mov/controller/search_controller.dart';

class SearchScreen extends GetView<SearchControllerr> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: GetBuilder<SearchControllerr>(builder: (_) {
        return Column(
          children: [
            // CupertinoSearchTextField(
            //   // controller: controller.SearchC,
            //   prefixIcon: Icon(Icons.search),
            // )
          ],
        );
      }),
    ));
  }
}
