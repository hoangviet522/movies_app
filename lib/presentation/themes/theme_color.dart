import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();

  static const primaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.1, 0.5, 0.8, 1.0],
    colors: [
      Color(0xFFF97474),
      Color(0xFF5E2D3F),
      Color(0xFF0B0623),
      Color(0xFF07031C),
    ],
  );

  static const Color lightBlue = Colors.lightBlue;

  static const Color borderColor = Color(0xFFE9E9E9);

  static const Color vulcan = Color(0xFF141221);
  static const Color royalBlue = Color(0xFF604FEF);
  static const Color violet = Color(0xFFA74DBC);

  static const SignInButton = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFFF97474),
        Color(0xFF5E2D3F),
      ]);

  // static const Color borderColor = Color(0xFFE9E9E9);

}
