import 'package:flutter/material.dart';

import '../../../../../../core/constance.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_media_query.dart';

class ShopNowButton extends StatelessWidget {
  const ShopNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: CustomButton(
          height:
          mediaQueryOfHeight(context: context, multiBy: .035),
          width: mediaQueryOfWidth(context: context, multiBy: .3),
          text: 'Shop Now',
          radius: 10.0,
          buttonColor: kPrimaryColor,
          onPressed: () {},
          style: Styles.style12.copyWith(color: Colors.white)),
    );
  }
}
