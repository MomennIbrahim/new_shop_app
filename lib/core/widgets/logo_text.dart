import 'package:flutter/material.dart';

import '../constance.dart';
import '../utils/styles.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Online Store',
      style: Styles.style18.copyWith(color: kPrimaryColor),
    );
  }
}
