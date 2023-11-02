import 'package:flutter/material.dart';
import 'package:route_app/core/widgets/custom_navigator.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../edit_user_phone_screen.dart';
import 'edit_button.dart';

class UserMobileNumber extends StatelessWidget {
  const UserMobileNumber({super.key, required this.mobileNumberController, required this.labelText});

  final TextEditingController mobileNumberController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            controller: mobileNumberController,
            keyBoardType: TextInputType.phone,
            hasSuffixIcon: false,
            enabled: false,
            labelText: labelText,
            validatorText: 'Mobile field is empty',
          ),
        ),
        EditButton(
          onPressed: (){
            customNavigator(context: context, widget: EditUserPhoneScreen());
          },
        ),
      ],
    );
  }
}
