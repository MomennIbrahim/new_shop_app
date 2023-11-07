import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/widgets/custom_navigator.dart';
import 'package:route_app/features/favorite/presentation/screens/favorite_screen/widgets/add_cart_button.dart';
import '../../../../../../core/constance.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_media_query.dart';
import '../../../../../favorite/presentation/controller/favorite_cubit/favorite_cubit.dart';
import '../../../../../home/presentation/controller/product_cubit/product_cubit.dart';
import '../../favorite_item_details_screen/favorite_item_details_screen.dart';
import 'loading_favorite_item.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteSuccessState) {
          return Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 8.0,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    customNavigator(
                        context: context,
                        widget: FavoriteItemDetailsScreen(index: index));
                  },
                  child: SizedBox(
                    height: 113.h,
                    width: double.maxFinite,
                    child: Stack(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: Styles.borderRadius15(),
                            side: BorderSide(
                              color: kPrimaryColor,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CachedNetworkImage(
                                    fit: BoxFit.contain,
                                    height: double.maxFinite,
                                    width: mediaQueryOfWidth(
                                        context: context, multiBy: 0.2),
                                    imageUrl: state.favoriteModel.data!
                                        .data![index].product!.image!),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: mediaQueryOfHeight(
                                                context: context,
                                                multiBy: .02)),
                                        child: Text(
                                          '${state.favoriteModel.data!.data![index].product!.name}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Styles.style18.copyWith(
                                              color: const Color(0xff06004F)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: mediaQueryOfHeight(
                                            context: context, multiBy: .003),
                                      ),
                                      Text(
                                        '${state.favoriteModel.data!.data![index].product!.description}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Styles.style14
                                            .copyWith(color: kPrimaryColor),
                                      ),
                                      SizedBox(
                                        height: mediaQueryOfHeight(
                                            context: context, multiBy: .003),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'EGP ${state.favoriteModel.data!.data![index].product!.price}',
                                              style: Styles.style14.copyWith(
                                                  color:
                                                      const Color(0xff06004F)),
                                            ),
                                            SizedBox(
                                              width: mediaQueryOfWidth(
                                                  context: context,
                                                  multiBy: 0.02),
                                            ),
                                            if (state
                                                    .favoriteModel
                                                    .data!
                                                    .data![index]
                                                    .product!
                                                    .discount !=
                                                0)
                                              Text(
                                                  '${state.favoriteModel.data!.data![index].product!.oldPrice}',
                                                  style: TextStyle(
                                                      fontSize: 11.0.sp,
                                                      decoration: TextDecoration
                                                          .lineThrough)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    EasyLoading.show(
                                        maskType: EasyLoadingMaskType.black);
                                    ProductCubit.get(context)
                                        .addProductInFavorite(
                                            productId: state.favoriteModel.data!
                                                .data![index].product!.id!)
                                        .then((value) {
                                      FavoriteCubit.get(context)
                                          .getFavoriteData();
                                      EasyLoading.dismiss();
                                    });
                                  },
                                  icon: Icon(
                                    IconlyLight.delete,
                                    color: kPrimaryColor,
                                  ))
                            ],
                          ),
                        ),
                        CartButton(index: index),
                        if (state.favoriteModel.data!.data![index].product!
                                .discount !=
                            0)
                          Positioned(
                            left: 12,
                            bottom: 4,
                            child: Image(
                              image: const AssetImage(
                                'assets/images/dicount.png',
                              ),
                              width: 50.w,
                              height: 50.h,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: state.favoriteModel.data!.data!.length,
            ),
          );
        } else if (state is FavoriteFailureState) {
          return Text(state.errMessage);
        } else {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 1.8,
          ));
        }
      },
    );
  }
}
