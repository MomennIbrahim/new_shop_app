import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constance.dart';
import '../../../../../home/presentation/controller/product_cubit/product_cubit.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if(state is AddCartLoadingState){
          EasyLoading.show(status: 'loading...',maskType: EasyLoadingMaskType.black);
        }
        if (state is AddCartSuccessState) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess(state.postCartModel.message!);
        }
      },
      builder: (context, state) {
        return Positioned(
          right: 12.w,
          bottom: 8.h,
          child: GestureDetector(
              onTap: () {
                ProductCubit.get(context).addToCart(
                    productId: ProductCubit.get(context)
                        .productModel!
                        .data!
                        .products![index]
                        .id!);
              },
              child: CircleAvatar(
                backgroundColor: kPrimaryColor,
                radius: 16.r,
                child: const Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                  size: 20,
                ),
              )),
        );
      },
    );
  }
}
