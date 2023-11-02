import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constance.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';

class PriceText extends StatelessWidget {
  const PriceText({super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    return Text(
      price,
      style: Styles.style18
          .copyWith(color: const Color(0xff06004F)),
    );
  }
}
