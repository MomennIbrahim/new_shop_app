import 'package:flutter/material.dart';
import 'custom_media_query.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.obscureText,
    required this.keyBoardType,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconPressed,
    required this.hasSuffixIcon,
    required this.labelText,
    required this.validatorText,
    this.enabled = true,
    this.onFieldSubmitted,
    this.hasOnSubmitted = false,
  });

  final TextEditingController controller;
  final TextInputType keyBoardType;
  final String labelText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final Function? suffixIconPressed;
  final Function? onFieldSubmitted;
  final bool hasSuffixIcon;
  final bool hasOnSubmitted;
  final bool? obscureText;
  final String validatorText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: mediaQueryOfWidth(context: context, multiBy: 0.04)),
      child: TextFormField(
          obscureText: obscureText ?? false,
          controller: controller,
          keyboardType: keyBoardType,
          onFieldSubmitted: hasOnSubmitted
              ? (value) {
                  onFieldSubmitted!();
                }
              : null,
          validator: (value) {
            if (value!.isEmpty) {
              return validatorText;
            }
            return null;
          },
          decoration: InputDecoration(
            enabled: enabled,
            focusedBorder: outLineInputBorder(),
            hintText: labelText,
            prefixIcon: prefixIcon ?? prefixIcon,
            suffixIcon: hasSuffixIcon
                ? IconButton(
                    onPressed: () {
                      suffixIconPressed!();
                    },
                    icon: suffixIcon!)
                : null,
            fillColor: Colors.white,
            filled: true,
            enabledBorder: outLineInputBorder(),
          )),
    );
  }

  outLineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(15.0),
    );
  }
}
