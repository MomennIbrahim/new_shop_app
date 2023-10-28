import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:route_app/features/layout/presentation/controller/favorite_cubit/favorite_cubit.dart';
import 'package:route_app/features/layout/presentation/controller/product_cubit/product_cubit.dart';
import 'package:route_app/features/layout/presentation/screens/home_screen/widgets/loading_product_item.dart';
import 'package:route_app/features/layout/presentation/screens/home_screen/widgets/product_item.dart';

class GridViewOfProduct extends StatelessWidget {
  const GridViewOfProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (BuildContext context, ProductState state) {
        if (state is AddFavoriteLoadingState) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        } else if (state is AddFavoriteSuccessState) {
          EasyLoading.showSuccess(state.productModel.message);
        }
      },
      builder: (context, state) {
        var cubit = ProductCubit.get(context);

        return BuildCondition(
          condition: cubit.productModel1 != null,
          builder: (context) => state is! GetProductDataFailureState
              ? Column(
                  children: [
                    GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0,
                        childAspectRatio: .55.h,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                          cubit.productModel1!.data!.products!.length, (index) {
                        return AnimationConfiguration.staggeredList(
                          delay: const Duration(milliseconds: 200),
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: SlideAnimation(
                              child: ProductItem(
                                index: index,
                                productModel: cubit.productModel1!,
                                onPressed: () {
                                  cubit.addProductInFavorite(
                                      productId: cubit.productModel1!.data!
                                          .products![index].id!).then((value) {
                                            FavoriteCubit.get(context).getFavoriteData();
                                  });
                                },

                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                )
              : Text(cubit.failure1!.errMessage),
          fallback: (context) => const LoadingProductItems(),
        );
      },
    );
  }
}
