import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.passwordController,
    required this.obscureText,
    required this.suffixIcon,
    required this.suffixIconPressed,
  });

  final TextEditingController passwordController;
  final bool obscureText;
  final Icon suffixIcon;
  final Function suffixIconPressed;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      keyBoardType: TextInputType.visiblePassword,
      hasSuffixIcon: true,
      obscureText: obscureText,
      suffixIcon: suffixIcon,
      suffixIconPressed: () {
        suffixIconPressed();
      },
      labelText: 'enter your password',
      validatorText: 'password field is require',
    );
  }
}
