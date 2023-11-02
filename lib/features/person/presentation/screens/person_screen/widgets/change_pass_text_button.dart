import 'package:flutter/material.dart';
import 'package:route_app/core/widgets/custom_navigator.dart';

import '../change_password_screen.dart';

class ChangePassTextButton extends StatelessWidget {
  const ChangePassTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Change Password'),
      onPressed: () {
        customNavigator(context: context, widget: ChangePasswordScreen());
      },
    );
  }
}
