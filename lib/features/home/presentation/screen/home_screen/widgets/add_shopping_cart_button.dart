import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/constance.dart';
import '../../../../data/model/product_model/product_model.dart';
import '../../../controller/product_cubit/product_cubit.dart';

class AddShoppingCartButton extends StatelessWidget {
  const AddShoppingCartButton({super.key,required this.productModel, required this.index});

  final ProductModel productModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if(state is AddCartLoadingState){
          EasyLoading.show(status: 'loading',maskType: EasyLoadingMaskType.black);
        }
        else if(state is AddCartSuccessState){
          if(state.postCartModel.status == true){
            EasyLoading.dismiss();
            EasyLoading.showSuccess(state.postCartModel.message!);
          }
        }
      },
      builder: (context, state) {
        return Positioned(
          right: 0.0,
          bottom: 10.0,
          child: GestureDetector(
            onTap: () {
              ProductCubit.get(context).addToCart(
                  productId: productModel.data!.products![index].id!);
            },
            child: CircleAvatar(
                radius: 20.0.sp,
                backgroundColor: ProductCubit.get(context).carts[productModel.data!.products![index].id]! == true? kPrimaryColor : Colors.grey,
                child: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                  size: 20.sp,
                )),
          ),
        );
      },
    );
  }
}
