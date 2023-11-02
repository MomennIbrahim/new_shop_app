import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../favorite/presentation/controller/favorite_cubit/favorite_cubit.dart';
import '../../../../data/model/product_model/product_model.dart';
import '../../../controller/product_cubit/product_cubit.dart';

class AddFavoriteButton extends StatelessWidget {
  const AddFavoriteButton(
      {super.key,
      required this.backgroundColor,
      required this.productModel,
      required this.index});

  final Color backgroundColor;
  final ProductModel productModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Positioned(
          top: 8.0,
          child: CircleAvatar(
            backgroundColor: backgroundColor,
            child: IconButton(
              splashColor: Colors.grey[100],
              onPressed: () {
                ProductCubit.get(context).addProductInFavorite(
                    productId: productModel.data!.products![index].id!);
              },
              icon: const Icon(
                IconlyLight.heart,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
