import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    elevation: 0,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}
