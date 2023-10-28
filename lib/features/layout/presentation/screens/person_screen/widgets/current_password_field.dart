import 'package:flutter/material.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class CurrentPasswordField extends StatelessWidget {
  const CurrentPasswordField({super.key, required this.currentPasswordController, required this.obscureText, });

  final TextEditingController currentPasswordController;
  final bool obscureText;


  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: currentPasswordController,
      keyBoardType: TextInputType.visiblePassword,
      hasSuffixIcon: false,
      obscureText: obscureText,
      labelText: 'Current password',
      validatorText: 'Current password field is required',
    );
  }
}
