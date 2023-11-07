import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:route_app/features/favorite/presentation/controller/favorite_cubit/favorite_cubit.dart';
import '../../../../../core/constance.dart';
import '../../../../home/presentation/controller/product_cubit/product_cubit.dart';
import '../../../data/model/search_model.dart';

class SearchAddFavButton extends StatelessWidget {
  const SearchAddFavButton(
      {super.key, required this.searchModel, required this.index});

  final SearchModel searchModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductCubit, ProductState>(
      listener: (context, state) {
        if(state is AddFavoriteLoadingState){
          EasyLoading.show(status: 'loading',maskType: EasyLoadingMaskType.black);
        }
        if (state is AddFavoriteSuccessState) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess(state.productModel.message);
        }
      },
      child: GestureDetector(
          onTap: () {
            ProductCubit.get(context)
                .addProductInFavorite(
                productId: searchModel
                    .data!.data![index].id!).then((value) {
                      FavoriteCubit.get(context).getFavoriteData();
            });
          },
          child: CircleAvatar(
            backgroundColor: kPrimaryColor,
            radius: 16,
            child: const Icon(
              IconlyLight.heart,
              color: Colors.white,
              size: 20,
            ),
          )),
    );
  }
}
