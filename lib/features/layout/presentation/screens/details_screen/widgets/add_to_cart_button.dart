import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constance.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CustomButton(
          text: 'Add to cart',
          hasIcon: true,
          icon: Icons.add_shopping_cart,
          onPressed: () {},
          style: Styles.style18,
          buttonColor: kPrimaryColor,
          height: 36.h,
          radius: 20.0,
        ));
  }
}
