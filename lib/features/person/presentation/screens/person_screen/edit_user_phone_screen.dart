import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/utils/servic_locator.dart';
import 'package:route_app/core/utils/styles.dart';
import 'package:route_app/core/widgets/custom_button.dart';
import 'package:route_app/features/layout/presentation/screens/layout_screen.dart';
import 'package:route_app/features/person/data/repository/person_repository_implementation.dart';
import '../../../../../core/constance.dart';
import '../../../../../core/widgets/custom_media_query.dart';
import '../../../../../core/widgets/custom_navigator.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../auth/presentation/screens/widgets/text_up_field.dart';
import '../../../../favorite/presentation/screens/favorite_item_details_screen/widgets/route_logo_and_back_button.dart';
import '../../controller/person_cubit/person_cubit.dart';
import '../../controller/update_cubit/update_cubit.dart';

class EditUserPhoneScreen extends StatelessWidget {
  EditUserPhoneScreen({
    super.key,
  });

  final TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UpdateCubit(getIt.get<PersonRepositoryImplementation>()),
      child: BlocConsumer<UpdateCubit, UpdateState>(
        listener: (context, state) {
          if (state is UpdateUserLoadingState) {
            EasyLoading.show(status: 'loading');
          } else if (state is UpdateUserSuccessState) {
            EasyLoading.dismiss();
            PersonCubit.get(context).getPersonData().then((value) {
              customNavigatorAndReplacement(context: context, widget: const LayoutScreen());
            });
          }
        },
        builder: (context, state) {
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
                  const RouteLogoAndArrowBack(),
                  SizedBox(
                    height: 24.h,
                  ),
                  TextUpField(
                      text: 'Your new mobile number', textColor: kPrimaryColor),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    controller: mobileNumberController,
                    keyBoardType: TextInputType.phone,
                    hasSuffixIcon: false,
                    labelText: 'Your new mobile number',
                    validatorText: 'mobile number field is required',
                  ),
                  SizedBox(
                    height: 42.0.h,
                  ),
                  CustomButton(
                    text: 'Update',
                    onPressed: () {
                      UpdateCubit.get(context).updateProfile(
                        name: PersonCubit.get(context).userModel1!.data!.name!,
                        phone: mobileNumberController.text,
                        email:
                            PersonCubit.get(context).userModel1!.data!.email!,
                      );
                    },
                    style: Styles.style18,
                    buttonColor: kPrimaryColor,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
