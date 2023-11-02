import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constance.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';

class OldPriceText extends StatelessWidget {
  const OldPriceText({super.key, required this.oldPrice});

  final String oldPrice;

  @override
  Widget build(BuildContext context) {
    return Text(
      oldPrice,
      style: Styles.styleWithLineThrough11,
    );
  }
}
