import 'package:flutter/material.dart';
import 'package:route_app/core/constance.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_media_query.dart';

class TextUpField extends StatelessWidget {
  const TextUpField({super.key, required this.text, this.textColor= Colors.white});

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaQueryOfWidth(context: context, multiBy: .04)),
      child: Text(text,style: Styles.style18.copyWith(color: textColor),),
    );
  }
}
