import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:route_app/features/auth/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:route_app/features/auth/presentation/controller/sign_up_cubit/sign_up_state.dart';
import 'package:route_app/features/auth/presentation/screens/sign_in_screen.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_navigator.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.phoneController,
    required this.formKey,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          if (state.userModel.status == true) {
            customNavigator(context: context, widget: SignInScreen());
            EasyLoading.dismiss();
            EasyLoading.showSuccess('${state.userModel.message}',duration: const Duration(seconds: 2));
          } else if (state.userModel.status == false) {
            EasyLoading.showError(state.userModel.message!);
          }
        }else if (state is SignUpFailureState){
          EasyLoading.showError(state.errMessage.toString());
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Sign up',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              EasyLoading.show(
                  status: 'loading...', maskType: EasyLoadingMaskType.black);
              SignUpCubit.get(context).userSignUp(
                email: emailController.text,
                password: passwordController.text,
                phone: phoneController.text,
                name: nameController.text,
              );
            }
          },
          style: Styles.style20,
        );
      },
    );
  }
}
