import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class MobileNumberField extends StatelessWidget {
  const MobileNumberField({
    super.key,
    required this.mobileNumberController,
  });

  final TextEditingController mobileNumberController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: mobileNumberController,
      keyBoardType: TextInputType.phone,
      hasSuffixIcon: false,
      labelText: 'enter your mobile no.',
      validatorText: 'mobile field is require',
    );
  }
}
