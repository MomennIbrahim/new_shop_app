import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/constance.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: -40,
      child: CircleAvatar(
        radius: 40.r,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 30.r,
          backgroundColor: kPrimaryColor,
          child: Image(
            image: const AssetImage('assets/images/check.png'),
            width: 40.w,
          ),
        ),
      ),
    );
  }
}
