import 'package:flutter/material.dart';
import 'package:route_app/core/utils/local_storage.dart';
import 'package:route_app/core/widgets/custom_navigator.dart';
import 'package:route_app/features/auth/presentation/screens/sign_in_screen.dart';
import '../../../../../../core/constance.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../controller/layout_cubit/layout_cubit.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomButton(
      text: 'Sign Out',
      onPressed: () {
        LocalStorage.removeData(key: 'token').then((value) {
          customNavigator(context: context, widget: SignInScreen());
          LayoutCubit.get(context).currentIndex = 0;
        });
      },
      style: Styles.style18,
      buttonColor: kPrimaryColor,
    );
  }
}
