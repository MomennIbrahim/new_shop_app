import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/core/utils/styles.dart';
import 'package:route_app/features/auth/presentation/screens/widgets/text_up_field.dart';
import 'package:route_app/features/layout/presentation/controller/person_cubit/person_cubit.dart';
import 'package:route_app/features/layout/presentation/screens/person_screen/widgets/change_pass_text_button.dart';
import 'package:route_app/features/layout/presentation/screens/person_screen/widgets/sign_out_button.dart';
import 'package:route_app/features/layout/presentation/screens/person_screen/widgets/user_mobile_phone.dart';
import 'package:route_app/features/layout/presentation/screens/person_screen/widgets/user_name.dart';
import '../../../../../core/widgets/custom_media_query.dart';

class PersonScreen extends StatelessWidget {
  PersonScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonCubit, PersonState>(
      builder: (context, state) {
        if (state is GetPersonSuccessState) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: mediaQueryOfHeight(context: context, multiBy: 0.06),
                bottom: mediaQueryOfHeight(context: context, multiBy: 0.004),
                right: mediaQueryOfWidth(context: context, multiBy: .045),
                left: mediaQueryOfWidth(context: context, multiBy: .045),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/images/home-route.svg'),
                  SizedBox(
                    height: 24.h,
                  ),

                  ///user image , name and email
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40.0,
                        backgroundColor: kPrimaryColor,
                        child: const Text('No Image'),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.userModel.data!.name.toString(),
                              style: Styles.style18
                                  .copyWith(color: const Color(0xff06004F)),
                            ),
                            Text(
                              state.userModel.data!.email.toString(),
                              style: Styles.style14
                                  .copyWith(color: const Color(0xff06004F)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),

                  TextUpField(text: 'Your full name', textColor: kPrimaryColor),
                  SizedBox(
                    height: 16.h,
                  ),
                  UserName(
                      labelText: state.userModel.data!.name.toString(),
                      nameController: nameController,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  TextUpField(
                      text: 'Your mobile number', textColor: kPrimaryColor),
                  SizedBox(
                    height: 16.h,
                  ),
                  UserMobileNumber(
                    labelText: state.userModel.data!.phone.toString(),
                    mobileNumberController: mobileNumberController,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const ChangePassTextButton(),
                  SizedBox(
                    height: 24.h,
                  ),
                  const SignOutButton(),
                ],
              ),
            ),
          );
        } else if (state is GetPersonFailureState) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
