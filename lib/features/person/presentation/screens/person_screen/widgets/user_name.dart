import 'package:flutter/material.dart';
import 'package:route_app/core/widgets/custom_navigator.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../edit_user_name_screen.dart';
import 'edit_button.dart';

class UserName extends StatelessWidget {
  const UserName({
    super.key,
    required this.labelText,
    required this.nameController,

  });

  final TextEditingController nameController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            controller: nameController,
            enabled: false,
            keyBoardType: TextInputType.name,
            hasSuffixIcon: false,
            labelText: labelText,
            validatorText: 'name field is empty',
          ),
        ),
        EditButton(onPressed: () {
          customNavigator(
              context: context,
              widget: EditUserNameScreen());
        }),
      ],
    );
  }
}
