import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/features/favorite/presentation/controller/favorite_cubit/favorite_cubit.dart';
import 'package:route_app/features/search/presentation/controller/search_cubit.dart';
import '../../../../../core/constance.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/controller/product_cubit/product_cubit.dart';
import '../../../data/model/search_model.dart';

class SearchAddCartButton extends StatelessWidget {
  const SearchAddCartButton(
      {super.key, required this.searchModel, required this.index});

  final SearchModel searchModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductCubit, ProductState>(
      listener: (context, state) {
        if(state is AddCartLoadingState){
          EasyLoading.show(status: 'loading',maskType: EasyLoadingMaskType.black);
        }
        if (state is AddCartSuccessState) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess(state.postCartModel.message!);
        }
      },
      child:  GestureDetector(
          onTap: () {
            ProductCubit.get(context).addToCart(productId: searchModel.data!.data![index].id!);
          },
          child: Container(
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius:
                Styles.borderRadius15()),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 8.0.w, vertical: 8.h),
              child: Text(
                'Add to cart',
                style: Styles.style14
                    .copyWith(color: Colors.white),
              ),
            ),
          )),
    );
  }
}
