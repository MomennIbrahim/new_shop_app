import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/widgets/custom_appbar.dart';
import 'package:route_app/core/widgets/custom_button.dart';
import 'package:route_app/features/cart/presentation/controller/cart_cubit.dart';
import 'package:route_app/features/cart/presentation/screens/widgets/cart_item.dart';
import 'package:route_app/features/favorite/presentation/screens/favorite_screen/widgets/loading_favorite_item.dart';
import '../../../../../../core/constance.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_media_query.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetCartSuccessState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: mediaQueryOfHeight(context: context, multiBy: 0.004),
              right: mediaQueryOfWidth(context: context, multiBy: .045),
              left: mediaQueryOfWidth(context: context, multiBy: .045),
            ),
            child: Column(
              children: [
                CustomAppbar(
                    text: 'Cart', searchFunction: () {}, cartFunction: () {}),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8.0,
                    ),
                    itemBuilder: (context, index) {
                      return CartItem(cartsModel: state.cartsModel, index: index);
                    },
                    itemCount: state.cartsModel.data!.cartItems!.length,
                  ),
                ),
                Divider(color: kPrimaryColor,thickness: 0.8),
                Row(
                  children: [
                    Column(
                      children: [
                        const Text(
                            'Total price',
                        ),
                        SizedBox(height: 5.h,),
                        Text(
                          'EGP ${state.cartsModel.data!.total}',
                          style: Styles.style18.copyWith(color: kPrimaryColor),
                        ),
                      ],
                    ),
                    Expanded(
                        child: CustomButton(
                      text: 'Checkout ➡',
                      height: 40.0.h,
                      radius: 20.0.r,
                      onPressed: () {},
                      style: Styles.style18,
                      buttonColor: kPrimaryColor,
                    )),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                )
              ],
            ),
          );
        } else if (state is GetCartFailureState) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: LoadingFavoriteItem());
        }
      },
    );
  }
}
