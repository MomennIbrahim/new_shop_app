import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/constance.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../home/presentation/controller/product_cubit/product_cubit.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.model});

  final model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if(state is AddCartLoadingState){
          EasyLoading.show(status: 'loading',maskType: EasyLoadingMaskType.black);
        }else if(state is AddCartSuccessState){
           EasyLoading.dismiss();
           EasyLoading.showSuccess(state.postCartModel.message!);
        }
      },
      builder: (context, state) {
        return Expanded(
            child: CustomButton(
              text: 'Add to cart',
              hasIcon: true,
              icon: Icons.add_shopping_cart,
              onPressed: () {
                ProductCubit.get(context).addToCart(productId: model);
              },
              style: Styles.style18,
              buttonColor: kPrimaryColor,
              height: 36.h,
              radius: 20.0.r,
            ));
      },
    );
  }
}
