import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:route_app/core/utils/local_storage.dart';
import 'package:route_app/core/widgets/custom_navigator.dart';
import 'package:route_app/features/layout/presentation/controller/layout_cubit/layout_cubit.dart';
import 'package:route_app/features/layout/presentation/controller/person_cubit/person_cubit.dart';
import 'package:route_app/features/layout/presentation/screens/layout_screen.dart';
import '../../../../../core/constance.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../controller/sign_in_cubit/sign_in_cubit.dart';
import '../../controller/sign_in_cubit/sign_in_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(listener: (context, state) {
      if (state is SignInSuccessState) {
        if (state.userModel.status == true) {
          LocalStorage.setData(key: 'token', value: state.userModel.data!.token)
              .then((value) {
            token = state.userModel.data!.token;
            PersonCubit.get(context).getPersonData();
            EasyLoading.dismiss();
            EasyLoading.showSuccess('${state.userModel.message}',
                duration: const Duration(seconds: 2),
                maskType: EasyLoadingMaskType.black);
            customNavigatorAndRemoveUntil(
                context: context, widget: const LayoutScreen());
          });
        } else if (state.userModel.status == false) {
          EasyLoading.showError(state.userModel.message!);
        }
      }
    }, builder: (context, state) {
      return CustomButton(
        text: 'Login',
        onPressed: () {
          if (formKey.currentState!.validate()) {
            EasyLoading.show(
                status: 'loading...', maskType: EasyLoadingMaskType.black);
            SignInCubit.get(context).userSignIn(
              email: emailController.text,
              password: passwordController.text,
            );
          }
        },
        style: Styles.style20,
      );
    });
  }
}
