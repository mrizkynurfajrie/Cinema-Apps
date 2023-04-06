import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalogue/features/home/controller_home.dart';
import 'package:movie_catalogue/shared/constants/colors.dart';

class PageSearch extends GetView<ControllerHome> {
  const PageSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColor.bgColor,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}
