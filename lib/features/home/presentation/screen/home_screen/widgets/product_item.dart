import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/widgets/custom_navigator.dart';
import '../../../../../../core/constance.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_media_query.dart';
import '../../../../data/model/product_model/product_model.dart';
import '../../details_screen/details_screen.dart';
import 'add_favorite_button.dart';
import 'add_shopping_cart_button.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productModel,
    required this.index,
    required this.backgroundColor,
  });

  final ProductModel productModel;
  final int index;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customNavigator(
            context: context,
            widget: DetailsScreen(
              index: index,
            ));
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
            borderRadius: Styles.borderRadius15(),
           ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: ClipRRect(
                      borderRadius: Styles.borderRadius15(),
                      child: CachedNetworkImage(
                          height: mediaQueryOfHeight(
                              context: context, multiBy: 0.15),
                          width: double.infinity,
                          fit: BoxFit.contain,
                          imageUrl: productModel.data!.products![index].image
                              .toString()),
                    ),
                  ),
                  SizedBox(
                    height: mediaQueryOfHeight(context: context, multiBy: .01),
                  ),
                  Text(
                    productModel.data!.products![index].name.toString(),
                    style: Styles.style14,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    productModel.data!.products![index].description.toString(),
                    style: Styles.style14,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: mediaQueryOfHeight(context: context, multiBy: .01),
                  ),
                  Row(
                    children: [
                      Text(
                        'EGP ${productModel.data!.products![index].price}',
                        style: Styles.style14,
                        maxLines: 1,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      if (productModel.data!.products![index].discount != 0)
                        Expanded(
                          child: Text(
                            productModel.data!.products![index].oldPrice
                                .toString(),
                            style: Styles.styleWithLineThrough11,
                            maxLines: 1,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: mediaQueryOfHeight(context: context, multiBy: 0.01),
                  ),
                  Row(
                    children: [
                      Text(
                        'Review (4.8)',
                        style: Styles.style12,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.amberAccent,
                        size: 15.0,
                      ),
                    ],
                  ),
                ],
              ),
              AddFavoriteButton(
                backgroundColor: backgroundColor,
                productModel: productModel,
                index: index,
              ),
              if (productModel.data!.products![index].discount != 0)
                Positioned(
                  left: 0.0,
                  top: 8.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    radius: 22.0,
                    child: Text(
                      'Discount ${productModel.data!.products![index].discount}%',
                      style: Styles.style8,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              AddShoppingCartButton(
                index: index,
                productModel: productModel,
              )
            ],
          ),
        ),
      ),
    );
  }
}
