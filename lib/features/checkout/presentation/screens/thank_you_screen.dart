import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/widgets/custom_media_query.dart';
import 'package:route_app/features/checkout/presentation/screens/widgets/custom_check_icon.dart';
import 'package:route_app/features/checkout/presentation/screens/widgets/custom_dash_line.dart';
import 'package:route_app/features/checkout/presentation/screens/widgets/custom_shape.dart';
import 'package:route_app/features/checkout/presentation/screens/widgets/cutom_app_bar.dart';
import 'package:route_app/features/checkout/presentation/screens/widgets/thank_you_card.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            right: 22.0.w, left: 22.0.w, bottom: 5.h, top: 60.h),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const ThankYouCard(),
            Positioned(
              bottom: mediaQueryOfHeight(context: context, multiBy: .2) + 15,
              right: 24,
              left: 24,
              child: const CustomDashLine(),
            ),
            Positioned(
              left: -20.w,
              bottom: mediaQueryOfHeight(context: context, multiBy: .2),
              child: const CustomShape(),
            ),
            Positioned(
              right: -20.w,
              bottom: mediaQueryOfHeight(context: context, multiBy: .2),
              child: const CustomShape(),
            ),
            const CustomCheckIcon(),
           IconButton(onPressed: (){
             Navigator.pop(context);
           }, icon: const Icon(IconlyLight.arrowLeft,color: Colors.white,size: 30,))
          ],
        ),
      ),
    );
  }
}
