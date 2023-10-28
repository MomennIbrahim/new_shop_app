import 'package:flutter/material.dart';
import 'package:route_app/core/widgets/custom_navigator.dart';
import 'package:route_app/features/auth/presentation/screens/sign_in_screen.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_media_query.dart';

class HaveAccTextButton extends StatelessWidget {
  const HaveAccTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        customNavigatorAndReplacement(context: context, widget: SignInScreen());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Text(
            'Already have an account? Sign in',
            style: Styles.style18,
          ),
        ),
      ),
    );
  }
}
