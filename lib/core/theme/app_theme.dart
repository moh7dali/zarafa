import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const primaryColor = Color(0xff9D00DE);
  static const backCardColor = Color(0xffFBF1FF);
  static const gradientColor1 = Color(0xffFD01FF);
  static const gradientColor2 = Color(0xff01D9DC);
  static const blackColor = Color(0xff000000);
  static const whiteColor = Color(0xffffffff);

  static const double size18 = 18;
  static const double size16 = 16;
  static const double size14 = 14;
  static const double size12 = 12;

  static final primaryGradient = LinearGradient(colors: [
    gradientColor1,
    gradientColor2,
  ],begin: Alignment.topRight, end: Alignment.bottomLeft);
  static final nonPrimaryGradient = LinearGradient(colors: [
    blackColor.withOpacity(.3),
    whiteColor.withOpacity(.7)
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  static TextStyle textStyle({required Color color, double size = size16, bool isBold = false}) {
    return TextStyle(color: color, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontSize: size.sp);
  }
}
