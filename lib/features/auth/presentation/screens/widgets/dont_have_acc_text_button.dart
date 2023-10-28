import 'package:flutter/material.dart';
import 'package:route_app/core/widgets/custom_navigator.dart';
import 'package:route_app/features/auth/presentation/screens/sign_up_screen.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_media_query.dart';

class DoNotHaveAccTextButton extends StatelessWidget {
  const DoNotHaveAccTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        customNavigator(context: context, widget: SignUpScreen());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Text(
            'Don’t have an account? Create Account',
            style: Styles.style18,
          ),
        ),
      ),
    );
  }
}
