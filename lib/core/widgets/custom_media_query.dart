import 'package:flutter/material.dart';

Size screenSize(context) {
  return MediaQuery.of(context).size;
}

double mediaQueryOfHeight({required BuildContext context, required double multiBy}) {
  return screenSize(context).height * multiBy;
}

double mediaQueryOfWidth({required BuildContext context, required double multiBy}) {
  return screenSize(context).width * multiBy;
}