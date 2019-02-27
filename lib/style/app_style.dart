import 'package:flutter/material.dart';

class AppColors {
  ///定义一个主色，可以定义多个，根据自己的项目需要
  static const int primaryValue = 0xFFa1dd70;
  static const Color primaryColor = Color(0xFFa1dd70);

  /// 调色板
  static const MaterialColor primarySwatch = const MaterialColor(primaryValue, const <int, Color>{
    50: Color(0xFFeffce5),
    100: Color(0xFFecf9e2),
    200: Color(0xFFd6f1c0),
    300: Color(0xFFc3eaa4),
    400: Color(0xFFb3e48b),
    500: primaryColor,
    600: Color(0xFF80b159),
    700: Color(0xFF608443),
    800: Color(0xFF40582c),
    900: Color(0xFF202c16),
  });
}
