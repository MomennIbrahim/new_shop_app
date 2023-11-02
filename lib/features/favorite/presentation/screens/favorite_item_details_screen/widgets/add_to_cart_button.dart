import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/widgets/custom_navigator.dart';
import 'package:route_app/features/home/data/model/product_model/product_model.dart';
import '../../../../../../core/constance.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../cart/presentation/screens/cart_screen.dart';
import '../../../../../home/presentation/controller/product_cubit/product_cubit.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton(
      {super.key, required this.productModel, required this.index});

  final ProductModel productModel;
  final int index;


  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CustomButton(
          text: ProductCubit
              .get(context)
              .carts[ ProductCubit
              .get(context)
              .productModel!
              .data!
              .products![index].id] == false? 'Add to cart':'In Cart',
          hasIcon: true,
          icon: Icons.add_shopping_cart,
          onPressed: () {
            ProductCubit.get(context).addToCart(
                productId: productModel.data!.products![index].id!);
          },
          style: Styles.style18,
          buttonColor: ProductCubit
              .get(context)
              .carts[ ProductCubit
              .get(context)
              .productModel!
              .data!
              .products![index].id] == false? Colors.grey : kPrimaryColor,
          height: 36.h,
          radius: 20.0.r,
        ));
  }
}
