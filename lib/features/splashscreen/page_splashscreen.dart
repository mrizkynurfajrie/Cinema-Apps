import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalogue/features/splashscreen/controller_splashscreen.dart';
import 'package:movie_catalogue/shared/constants/colors.dart';
import 'package:movie_catalogue/shared/constants/styles.dart';

class PageSplashscreen extends GetView<ControllerSplashscreen> {
  const PageSplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundSplash(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 240,
            width: 240,
            child: Image.asset('assets/elemes_logo.png'),
          ),
        ],
      ),
    );
  }
}

class BackgroundSplash extends StatelessWidget {
  const BackgroundSplash({required this.child, super.key});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            color: AppColor.bgColor,
          ),
          Image.asset('assets/curved_line.png'),
          child!,
        ],
      ),
    );
  }
}
