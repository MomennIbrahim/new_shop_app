import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/core/utils/styles.dart';
import '../../../../../../core/widgets/custom_media_query.dart';
import '../../../../favorite/presentation/controller/favorite_cubit/favorite_cubit.dart';
import '../../../../home/presentation/screen/details_screen/widgets/add_to_cart_button.dart';
import '../../../../home/presentation/screen/details_screen/widgets/old_price_text.dart';
import '../../../../home/presentation/screen/details_screen/widgets/price_text.dart';
import '../../../../home/presentation/screen/details_screen/widgets/product_name.dart';
import '../../../../home/presentation/screen/details_screen/widgets/route_logo_and_back_button.dart';
import '../../../../home/presentation/screen/home_screen/widgets/loading_banners.dart';

class FavoriteItemDetailsScreen extends StatefulWidget {
  const FavoriteItemDetailsScreen({super.key, required this.index});

  final int index;

  @override
  State<FavoriteItemDetailsScreen> createState() => _CarouselBannersState();
}

class _CarouselBannersState extends State<FavoriteItemDetailsScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteSuccessState) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: mediaQueryOfHeight(context: context, multiBy: 0.06),
                bottom: mediaQueryOfHeight(context: context, multiBy: 0.05),
                right: mediaQueryOfWidth(context: context, multiBy: .045),
                left: mediaQueryOfWidth(context: context, multiBy: .045),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RouteLogoAndArrowBack(),
                  SizedBox(
                    height: 24.h,
                  ),
                  Stack(
                    children: [
                      CachedNetworkImage(imageUrl: state.favoriteModel.data!.data![widget.index].product!.image.toString(),
                        width: double.maxFinite,
                        fit: BoxFit.fitHeight,
                      ),
                      if(state.favoriteModel.data!.data![widget.index].product!.discount != 0)
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/dicount.png'),
                          backgroundColor: Colors.transparent,
                          radius: 40.0,
                        ),
                    ],
                  ),
                  SizedBox(
                    height: mediaQueryOfHeight(context: context, multiBy: 0.02),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  ProductName(
                    name: state.favoriteModel.data!.data![widget.index].product!.name
                        .toString(),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Description',
                    style: Styles.style18.copyWith(color: kPrimaryColor),
                  ),
                  Text(
                    state.favoriteModel.data!.data![widget.index].product!.description
                        .toString(),
                    style:
                        Styles.style14.copyWith(color: const Color(0xff06004F)),
                    overflow: isExpanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                    maxLines: isExpanded ? null : 2,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(isExpanded ? 'Read less' : '...Read more',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ))),
                  SizedBox(
                    height: 16.h,
                  ),
                   Row(
                    children: [
                      PriceText(price: 'EGP ${state.favoriteModel.data!.data![widget.index].product!.price}'),
                      SizedBox(width: 10.w,),
                      if(state.favoriteModel.data!.data![widget.index].product!.discount != 0)
                        OldPriceText(oldPrice: '${state.favoriteModel.data!.data![widget.index].product!.oldPrice}'),

                      AddToCartButton(model: state.favoriteModel.data!.data![widget.index].product!.id,),

                    ],
                  ),
                ],
              ),
            ),
          );
        } else if (state is FavoriteFailureState) {
          return Center(child: Text(state.errMessage.toString()));
        } else {
          return const LoadingBanners();
        }
      },
    );
  }
}
