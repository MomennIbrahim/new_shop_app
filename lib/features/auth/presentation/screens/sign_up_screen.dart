import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/email_field.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/have_acc_textButton.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/mobile_number_field.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/name_field.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/password_field.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/route_image.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/sign_up_button.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/text_up_field.dart';
import '../../../../core/constance.dart';
import '../../../../core/utils/servic_locator.dart';
import '../../../../core/widgets/custom_media_query.dart';
import '../../data/repositories/auth_repository_implementation.dart';
import '../controller/sign_up_cubit/sign_up_cubit.dart';
import '../controller/sign_up_cubit/sign_up_state.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignUpCubit(getIt.get<AuthRepositoryImplementation>()),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var signUpCubit = SignUpCubit.get(context);
          return Scaffold(
            backgroundColor: kPrimaryColor,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RouteImage(),
                    SizedBox(
                      height:
                          mediaQueryOfHeight(context: context, multiBy: .045),
                    ),
                    const TextUpField(text: 'Full Name'),
                    SizedBox(
                      height:
                          mediaQueryOfHeight(context: context, multiBy: 0.03),
                    ),
                    NameField(nameController: fullNameController,),
                    SizedBox(
                      height:
                          mediaQueryOfHeight(context: context, multiBy: 0.03),
                    ),
                    const TextUpField(text: 'E-mail address'),
                    SizedBox(
                      height:
                          mediaQueryOfHeight(context: context, multiBy: 0.03),
                    ),
                    EmailField(emailController: emailController),
                    SizedBox(
                      height:
                          mediaQueryOfHeight(context: context, multiBy: 0.03),
                    ),
                    const TextUpField(text: 'Password'),
                    SizedBox(
                      height:
                          mediaQueryOfHeight(context: context, multiBy: 0.03),
                    ),
                    PasswordField(
                      passwordController: passwordController,
                      obscureText: signUpCubit.isVisibility,
                      suffixIcon: signUpCubit.suffixIcon,
                      suffixIconPressed: () {
                        signUpCubit.changeIconVisibility();
                      },
                    ),

                    SizedBox(
                      height:
                          mediaQueryOfHeight(context: context, multiBy: 0.03),
                    ),
                    const TextUpField(text: 'Mobile Number'),
                    SizedBox(
                      height:
                          mediaQueryOfHeight(context: context, multiBy: 0.03),
                    ),
                    MobileNumberField(
                        mobileNumberController: mobileNumberController),
                    SizedBox(
                      height:
                          mediaQueryOfHeight(context: context, multiBy: 0.065),
                    ),
                    SignUpButton(
                      emailController: emailController,
                      passwordController: passwordController,
                      nameController: fullNameController,
                      phoneController: mobileNumberController,
                      formKey: formKey,
                    ),
                    SizedBox(
                      height:
                          mediaQueryOfHeight(context: context, multiBy: 0.038),
                    ),
                    const HaveAccTextButton(),
                    SizedBox(
                      height:
                          mediaQueryOfHeight(context: context, multiBy: .02),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
