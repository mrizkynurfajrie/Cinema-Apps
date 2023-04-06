import 'package:flutter/material.dart';

class AppColor {
  //NEUTRAL
  static const MaterialColor neutral = MaterialColor(
    _neutral,
    <int, Color>{
      25: Color(0xFFFCFCFD),
      50: Color(0xFFF9FAFB),
      100: Color(0xFFF3F4F6),
      200: Color(0xFFE5E7EB),
      300: Color(0xFFD2D6DB),
      400: Color(0xFF9DA4AE),
      500: Color(0xFF6C737F),
      600: Color(0xFF4D5761),
      700: Color(0xFF384250),
      800: Color(0xFF1F2A37),
      900: Color(_neutral),
    },
  );
  static const int _neutral = 0xFF111927;

  //GRADIENT
  static const LinearGradient shimmerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.3, 0.5, 0.7],
    colors: [
      Color.fromARGB(255, 220, 220, 220),
      Color.fromARGB(255, 169, 169, 169),
      Color.fromARGB(255, 220, 220, 220),
    ],
  );

  //ACCENT
  static const Color primaryColor = Color(0xFF3043A9);
  static const Color transparentColor = Colors.transparent;
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color bgColor = Color(0xFFF6F1F1);
  static const Color boxItemColor = Color(0xFF0B2447);
}
