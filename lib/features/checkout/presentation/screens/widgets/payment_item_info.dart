import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({
    super.key,
    required this.title,
    required this.value,
    this.style,
  });

  final String title;
  final String value;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: style ?? Styles.style18,
        ),
        Text(value,
            style:
                style ?? Styles.style18.copyWith(fontWeight: FontWeight.w600))
      ],
    );
  }
}
