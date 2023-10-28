import 'package:flutter/material.dart';

import 'custom_media_query.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.style,
    this.buttonColor = Colors.white,
    this.radius = 16.0,
    this.width = double.infinity,
    this.height = 64.0,
    this.paddingHorizontal = 16.0,
  });

  final String text;
  final Function onPressed;
  final TextStyle style;
  final Color buttonColor;
  final double radius;
  final double width;
  final double height;
  final double paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: SizedBox(
        width: width,
        height: height,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          onPressed: () {
            onPressed();
          },
          color: buttonColor,
          child: Text(
            text,
            style: style,
          ),
        ),
      ),
    );
  }
}
