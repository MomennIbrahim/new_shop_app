import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/features/cart/data/model/carts_model.dart';
import '../../../../../core/constance.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_media_query.dart';
import '../../../../home/presentation/controller/product_cubit/product_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartsModel, required this.index});

  final CartsModel cartsModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // customNavigator(
        //     context: context,
        //     widget: FavoriteItemDetailsScreen(index: index));
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
                        imageUrl: cartsModel
                            .data!
                            .cartItems![index]
                            .product!
                            .image!),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 8.0),
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
                              '${cartsModel.data!.cartItems![index].product!.name}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.style18.copyWith(
                                  color: const Color(
                                      0xff06004F)),
                            ),
                          ),
                          SizedBox(
                            height: mediaQueryOfHeight(
                                context: context,
                                multiBy: .003),
                          ),
                          Text(
                            '${cartsModel.data!.cartItems![index].product!.description}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.style14.copyWith(
                                color: kPrimaryColor),
                          ),
                          SizedBox(
                            height: mediaQueryOfHeight(
                                context: context,
                                multiBy: .003),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                Text(
                                  'EGP ${cartsModel.data!.cartItems![index].product!.price}',
                                  style: Styles.style14
                                      .copyWith(
                                      color: const Color(
                                          0xff06004F)),
                                ),
                                SizedBox(
                                  width: mediaQueryOfWidth(
                                      context: context,
                                      multiBy: 0.02),
                                ),
                                if (1 != 0)
                                  Text(
                                      '${cartsModel.data!.cartItems![index].product!.oldPrice}',
                                      style: TextStyle(
                                          fontSize: 11.0.sp,
                                          decoration:
                                          TextDecoration
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
                            maskType:
                                EasyLoadingMaskType.black);
                        ProductCubit.get(context)
                            .addToCart(
                                productId:
                                    cartsModel
                                    .data!
                                    .cartItems![index]
                                    .product!
                                    .id!)
                            .then((value) {
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
            Positioned(
              right: 12,
              bottom: 8,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: Styles.borderRadius15(
                          topRight: 25,
                          bottomRight: 25,
                          topLeft: 25,
                          bottomLeft: 25)),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: Text(
                          '+',
                          style: Styles.style18,
                        ),
                        onTap: () {},
                      ),
                      Text(
                        '${cartsModel.data!.cartItems![index].quantity}',
                        style: Styles.style18,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          '-',
                          style: Styles.style18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (cartsModel.data!.cartItems![index]
                .product!.discount !=
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
  }
}
