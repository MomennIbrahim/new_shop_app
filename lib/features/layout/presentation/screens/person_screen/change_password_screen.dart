import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/core/utils/servic_locator.dart';
import 'package:route_app/core/utils/styles.dart';
import 'package:route_app/core/widgets/custom_button.dart';
import 'package:route_app/core/widgets/custom_navigator.dart';
import 'package:route_app/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:route_app/features/layout/data/repository/home_repository_implementation.dart';
import 'package:route_app/features/layout/presentation/controller/change_password_cubit/change_password_cubit.dart';
import 'package:route_app/features/layout/presentation/screens/person_screen/person_screen.dart';
import 'package:route_app/features/layout/presentation/screens/person_screen/widgets/current_password_field.dart';
import 'package:route_app/features/layout/presentation/screens/person_screen/widgets/new_password_field.dart';
import '../../../../../core/widgets/custom_media_query.dart';
import '../../../../auth/presentation/controller/sign_in_cubit/sign_in_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChangePasswordCubit(getIt.get<HomeRepositoryImplementation>()),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordLoadingState) {
            EasyLoading.show();
          } else if (state is ChangePasswordSuccessState) {
            if (state.userModel.status == true) {
              EasyLoading.dismiss();
              customNavigator(context: context, widget: PersonScreen());
              EasyLoading.showSuccess(state.userModel.message.toString());
            } else {
              EasyLoading.dismiss();
              EasyLoading.showError(state.userModel.message.toString());
            }
          } else if (state is ChangePasswordFailureState) {
            EasyLoading.showError(state.errMessage.toString());
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              top: mediaQueryOfHeight(context: context, multiBy: 0.06),
              bottom: mediaQueryOfHeight(context: context, multiBy: 0.004),
              right: mediaQueryOfWidth(context: context, multiBy: .045),
              left: mediaQueryOfWidth(context: context, multiBy: .045),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: kPrimaryColor,
                        )),
                    SvgPicture.asset('assets/images/home-route.svg'),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                CurrentPasswordField(
                  currentPasswordController: currentPasswordController,
                  obscureText: ChangePasswordCubit.get(context).isVisibility,
                ),
                SizedBox(
                  height: 16.h,
                ),
                NewPasswordField(
                  newPasswordController: newPasswordController,
                  obscureText: ChangePasswordCubit.get(context).isVisibility,
                  suffixIcon: ChangePasswordCubit.get(context).suffixIcon,
                  suffixIconPressed: () {
                    ChangePasswordCubit.get(context).changeIconVisibility();
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomButton(
                  text: 'Change',
                  onPressed: () {
                    ChangePasswordCubit.get(context).changePassword(
                      currentPassword: currentPasswordController.text,
                      newPassword: newPasswordController.text,
                    );
                  },
                  style: Styles.style18,
                  buttonColor: kPrimaryColor,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
