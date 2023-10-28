import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class NameField extends StatelessWidget {
  const NameField({super.key, required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      keyBoardType: TextInputType.name,
      hasSuffixIcon: false,
      labelText: 'enter your name',
      validatorText: 'name field is require',
    );
  }
}
