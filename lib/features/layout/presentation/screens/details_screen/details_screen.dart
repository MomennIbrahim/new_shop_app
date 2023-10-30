import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/core/utils/styles.dart';
import 'package:route_app/features/layout/presentation/controller/product_cubit/product_cubit.dart';
import 'package:route_app/features/layout/presentation/screens/details_screen/widgets/add_to_cart_button.dart';
import 'package:route_app/features/layout/presentation/screens/details_screen/widgets/old_price_text.dart';
import 'package:route_app/features/layout/presentation/screens/details_screen/widgets/price_text.dart';
import 'package:route_app/features/layout/presentation/screens/details_screen/widgets/product_name.dart';
import 'package:route_app/features/layout/presentation/screens/details_screen/widgets/route_logo_and_back_button.dart';
import 'package:route_app/features/layout/presentation/screens/home_screen/widgets/loading_banners.dart';
import '../../../../../../core/widgets/custom_media_query.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key, required this.index});

  int _currentSlide = 0;
  final int index;

  @override
  State<DetailsScreen> createState() => _CarouselBannersState();
}

class _CarouselBannersState extends State<DetailsScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is GetProductDataSuccessState) {
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
                  CarouselSlider(
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          widget._currentSlide = index;
                        });
                      },
                      height: 220.h,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 6),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: state
                        .productModel.data!.products![widget.index].images!
                        .map((i) {
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Stack(
                            children: [
                              CachedNetworkImage(imageUrl: i.toString(),
                                width: double.maxFinite,
                                fit: BoxFit.fitHeight,
                              ),
                              if(state
                                  .productModel.data!.products![widget.index].discount != 0)
                                const CircleAvatar(
                                backgroundImage: AssetImage('assets/images/dicount.png'),
                                backgroundColor: Colors.transparent,
                                radius: 40.0,
                              ),
                            ],
                          ));
                    }).toList(),
                  ),
                  SizedBox(
                    height: mediaQueryOfHeight(context: context, multiBy: 0.02),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: state
                          .productModel.data!.products![widget.index].images!
                          .map((e) {
                        int index = state
                            .productModel.data!.products![widget.index].images!
                            .indexOf(e);
                        return Container(
                            width: 10.0,
                            height: 10.0,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget._currentSlide == index
                                  ? kPrimaryColor
                                  : Colors.grey,
                            ));
                      }).toList()),
                  SizedBox(
                    height: 24.h,
                  ),
                  ProductName(
                    name: state.productModel.data!.products![widget.index].name
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
                    state.productModel.data!.products![widget.index].description
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
                      PriceText(price: 'EGP ${state.productModel.data!.products![widget.index].price}'),
                      SizedBox(width: 10.w,),
                      if(state.productModel.data!.products![widget.index].discount != 0)
                        OldPriceText(oldPrice: '${state.productModel.data!.products![widget.index].oldPrice}'),
                      const AddToCartButton(),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else if (state is GetProductDataFailureState) {
          return Center(child: Text(state.errMessage.toString()));
        } else {
          return const LoadingBanners();
        }
      },
    );
  }
}
