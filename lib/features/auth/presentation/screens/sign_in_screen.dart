import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/core/utils/servic_locator.dart';
import 'package:route_app/core/widgets/custom_media_query.dart';
import 'package:route_app/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:route_app/features/auth/presentation/controller/sign_in_cubit/sign_in_cubit.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/email_field.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/forget_text_button.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/dont_have_acc_text_button.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/login_button.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/password_field.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/route_image.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/sub_title.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/text_up_field.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/welcome_title.dart';
import '../controller/sign_in_cubit/sign_in_state.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignInCubit(getIt.get<AuthRepositoryImplementation>()),
      child: BlocConsumer<SignInCubit, SignInStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var signInCubit = SignInCubit.get(context);
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
                      height: mediaQueryOfHeight(context: context, multiBy: .1),
                    ),
                    const WelcomeTitle(),
                    const SubTitle(),
                    SizedBox(
                      height:
                          mediaQueryOfHeight(context: context, multiBy: .045),
                    ),
                    const TextUpField(text: 'User Name'),
                    SizedBox(
                      height:
                          mediaQueryOfHeight(context: context, multiBy: 0.03),
                    ),
                    EmailField(
                      emailController: emailController,
                    ),
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
                      obscureText: signInCubit.isVisibility,
                      suffixIcon: signInCubit.suffixIcon,
                      suffixIconPressed: () {
                        signInCubit.changeIconVisibility();
                      },
                    ),
                    SizedBox(
                      height:
                          mediaQueryOfHeight(context: context, multiBy: 0.018),
                    ),
                    const ForgetTextButton(),
                    SizedBox(
                      height:
                          mediaQueryOfHeight(context: context, multiBy: 0.065),
                    ),
                    LoginButton(
                      emailController: emailController,
                      passwordController: passwordController,
                      formKey: formKey,
                    ),
                    SizedBox(
                      height:
                          mediaQueryOfHeight(context: context, multiBy: 0.038),
                    ),
                    const DoNotHaveAccTextButton(),
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
