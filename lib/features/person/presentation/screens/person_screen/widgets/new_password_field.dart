import 'package:flutter/material.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class NewPasswordField extends StatelessWidget {
  const NewPasswordField({super.key, required this.newPasswordController, required this.obscureText, required this.suffixIcon, required this.suffixIconPressed});

  final TextEditingController newPasswordController;
  final bool obscureText;
  final Icon suffixIcon;
  final Function suffixIconPressed;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: newPasswordController,
      keyBoardType: TextInputType.visiblePassword,
      hasSuffixIcon: true,
      obscureText: obscureText,
      suffixIconPressed: (){
        suffixIconPressed();
      },
      suffixIcon: suffixIcon,
      labelText: 'New password',
      validatorText: 'Current password field is required',
    );
  }
}
