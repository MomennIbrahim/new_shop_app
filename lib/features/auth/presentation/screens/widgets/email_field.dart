import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      keyBoardType: TextInputType.emailAddress,
      hasSuffixIcon: false,
      labelText: 'enter your email address',
      validatorText: 'email field is require',
    );
  }
}
