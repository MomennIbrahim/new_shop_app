import 'package:flutter/material.dart';
import '../../../../../../core/constance.dart';
import '../../../../../../core/utils/styles.dart';

class SeeAllRow extends StatelessWidget {
  const SeeAllRow({super.key, required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Categories',
          style: Styles.style18.copyWith(color: kPrimaryColor),
        ),
        const Spacer(),
        TextButton(
            onPressed: () {
              onPressed();
            },
            child: Text(
              'see all',
              style: Styles.style12,
            ))
      ],
    );
  }
}
