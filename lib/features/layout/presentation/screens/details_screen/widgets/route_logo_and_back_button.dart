import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constance.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';

class RouteLogoAndArrowBack extends StatelessWidget {
  const RouteLogoAndArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new,color: kPrimaryColor,)),
        SvgPicture.asset('assets/images/home-route.svg'),
      ],
    );
  }
}
