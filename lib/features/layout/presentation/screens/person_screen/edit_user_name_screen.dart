import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_app/core/utils/servic_locator.dart';
import 'package:route_app/core/widgets/custom_navigator.dart';
import 'package:route_app/features/layout/data/repository/home_repository_implementation.dart';
import 'package:route_app/features/layout/presentation/controller/person_cubit/person_cubit.dart';
import 'package:route_app/features/layout/presentation/controller/product_cubit/product_cubit.dart';
import 'package:route_app/features/layout/presentation/controller/update_cubit/update_cubit.dart';
import 'package:route_app/features/layout/presentation/screens/layout_screen.dart';
import 'package:route_app/features/layout/presentation/screens/person_screen/person_screen.dart';
import '../../../../../core/constance.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_media_query.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../auth/presentation/screens/widgets/text_up_field.dart';

class EditUserNameScreen extends StatelessWidget {
  EditUserNameScreen({super.key});

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UpdateCubit(getIt.get<HomeRepositoryImplementation>()),
      child: BlocConsumer<UpdateCubit, UpdateState>(
        listener: (context, state) {
          if(state is UpdateUserLoadingState){
            EasyLoading.show(status: 'loading');
          }else if(state is UpdateUserSuccessState){
            EasyLoading.dismiss();
            PersonCubit.get(context).getPersonData().then((value) {
              customNavigatorAndReplacement(context: context, widget: const LayoutScreen());
            });
          }
        },
        builder: (context, state) {
          return  SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: mediaQueryOfHeight(context: context, multiBy: 0.06),
                bottom:
                mediaQueryOfHeight(context: context, multiBy: 0.004),
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
                    height: 24.h,
                  ),
                  TextUpField(
                      text: 'Your new name', textColor: kPrimaryColor),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    controller: nameController,
                    keyBoardType: TextInputType.name,
                    hasSuffixIcon: false,
                    labelText: 'Your new Name',
                    validatorText: 'New name field is empty',
                  ),
                  SizedBox(
                    height: 42.0.h,
                  ),
                  CustomButton(
                    text: 'Update',
                    onPressed: () {
                      UpdateCubit.get(context)
                          .updateProfile(
                        name: nameController.text,
                        phone: PersonCubit.get(context).userModel1!.data!.phone!,
                        email: PersonCubit.get(context).userModel1!.data!.email!,
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
