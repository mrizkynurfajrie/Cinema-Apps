import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:movie_catalogue/features/main/controller_main.dart';
import 'package:movie_catalogue/shared/constants/colors.dart';
import 'package:movie_catalogue/shared/widgets/custom_bottom_navbar.dart';

class PageMain extends GetView<ControllerMain> {
  PageMain({super.key});

  DateTime preBackpress = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () async {
          if (controller.currentPage.value != 0) {
            controller.changePage(0);
            controller.pageController.jumpToPage(0);
            return false;
          }

          const maxDuration = Duration(seconds: 2);
          final timegap = DateTime.now().difference(preBackpress);

          final cantExit = timegap >= maxDuration;

          preBackpress = DateTime.now();
          if (cantExit) {
            showToast(
              message: "Tekan sekali lagi untuk keluar",
              color: AppColor.neutral.withOpacity(0.6),
            );
            return false;
          } else {
            return true;
          }
        },
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: (pageIndex) {
            controller.changePage(pageIndex);
          },
          children: controller.pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(
          selectedIndex: controller.currentPage.value,
          onTap: (pageIndex) {
            controller.changePage(pageIndex);
            controller.pageController.jumpToPage(pageIndex);
          },
        ),
      ),
    );
  }
}

showToast(
    {required String message,
    Color? color,
    Color? textColor,
    ToastGravity? gravity}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color ?? AppColor.primaryColor.withOpacity(.4),
      textColor: textColor ?? AppColor.neutral.shade300,
      fontSize: 12);
}
