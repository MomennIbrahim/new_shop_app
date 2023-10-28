import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/constance.dart';

class Styles {

  static TextStyle style8 = TextStyle(
    fontSize: 8.0.sp,
    color: Colors.white,
  );

  static TextStyle style11 = TextStyle(
    fontSize: 11.0.sp,
    color: const Color(0xff004182),
    fontWeight: FontWeight.w400,
    letterSpacing: -0.165,
  );

  static TextStyle style12 = TextStyle(
    fontSize: 12.0.sp,
    color: const Color(0xff004182),
    fontWeight: FontWeight.w400,
    letterSpacing: -0.165,
  );

  static TextStyle style14 = TextStyle(
    fontSize: 14.0.sp,
    color: const Color(0xff004182),
    fontWeight: FontWeight.w400,
    letterSpacing: -0.165,
  );

  static TextStyle styleWithLineThrough11 = TextStyle(
      fontSize: 11.0.sp,
      color: const Color(0xff004182),
      fontWeight: FontWeight.w400,
      letterSpacing: -0.165,
      decoration: TextDecoration.lineThrough);

  static TextStyle style16 = TextStyle(
    fontSize: 16.0.sp,
    color: Colors.white,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.165,
  );

  static TextStyle style18 = TextStyle(
    fontSize: 18.0.sp,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.165,
  );

  static TextStyle style20 = TextStyle(
    fontSize: 20.0.sp,
    color: const Color(0xff004182),
    fontWeight: FontWeight.w600,
    letterSpacing: -0.165,
  );

  static TextStyle style24 = TextStyle(
    fontSize: 24.0.sp,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.165,
  );

  static BorderRadius borderRadius15(
      {double? bottomLeft,
      double? bottomRight,
      double? topLeft,
      double? topRight}) {
    return BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft ?? 15.0),
        bottomRight: Radius.circular(bottomRight ?? 15.0),
        topLeft: Radius.circular(topLeft ?? 15.0),
        topRight: Radius.circular(topRight ?? 15.0));
  }
}
