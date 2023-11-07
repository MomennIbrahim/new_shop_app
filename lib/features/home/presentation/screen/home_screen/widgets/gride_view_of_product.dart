import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../../../core/constance.dart';
import '../../../controller/product_cubit/product_cubit.dart';
import 'loading_product_item.dart';
import 'product_item.dart';

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
        else if(state is AddCartSuccessState){
        }
      },
      builder: (context, state) {
        var cubit = ProductCubit.get(context);
        return BuildCondition(
          condition: cubit.productModel != null ,
          builder: (context)=> Column(
            children: [
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 5.0,
                  childAspectRatio: .55.h,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                    cubit.productModel!.data!.products!.length, (index) {
                  return AnimationConfiguration.staggeredList(
                    delay: const Duration(milliseconds: 200),
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: SlideAnimation(
                        child: ProductItem(
                          backgroundColor: ProductCubit.get(context)
                              .favorites[cubit.productModel!.data!.products![index].id]!
                              ? kPrimaryColor
                              : Colors.grey[400]!,
                          index: index,
                          productModel: cubit.productModel!,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
          fallback: (context)=> const LoadingProductItems(),
        );
      },
    );
  }
}
