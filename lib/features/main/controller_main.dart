import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_catalogue/features/home/page_home.dart';
import 'package:movie_catalogue/features/profile/profile_page.dart';

class ControllerMain extends GetxController {
  late PageController pageController;
  var currentPage = 0.obs;
  final List<Widget> pages = [
    const PageHome(),
    const PageProfile(),
  ];

  void changePage(index) => currentPage.value = index;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentPage.value);
  }

  @override
  void onReady() async {
    super.onReady();
    var pageArg = Get.arguments;
    if (pageArg != null) {
      changePage(pageArg);
      pageController.jumpToPage(pageArg);
    }
  }
}
