import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/features/layout/presentation/controller/product_cubit/product_cubit.dart';
import 'package:route_app/features/layout/presentation/screens/home_screen/widgets/loading_banners.dart';
import '../../../../../../core/widgets/custom_media_query.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key});

  int _currentSlide = 0;

  @override
  State<DetailsScreen> createState() => _CarouselBannersState();
}

class _CarouselBannersState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is GetProductDataSuccessState) {
          return Padding(
            padding: EdgeInsets.only(
              top: mediaQueryOfHeight(context: context, multiBy: 0.06),
              bottom: mediaQueryOfHeight(context: context, multiBy: 0.004),
              right: mediaQueryOfWidth(context: context, multiBy: .045),
              left: mediaQueryOfWidth(context: context, multiBy: .045),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/images/home-route.svg'),
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
                    height: mediaQueryOfHeight(context: context, multiBy: 0.2),
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
                  items: state.productModel.data!.products!.map((i) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          image: NetworkImage(i.image.toString()),
                          fit: BoxFit.fill,
                        ));
                  }).toList(),
                ),
                SizedBox(
                  height: mediaQueryOfHeight(context: context, multiBy: 0.02),
                ),
                // Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: state.productModel.data!.products!.map((e) {
                //       int index = state.productModel.data!.products!.indexOf(e);
                //       return Container(
                //           width: 10.0,
                //           height: 10.0,
                //           margin: const EdgeInsets.symmetric(horizontal: 4.0),
                //           decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             color: widget._currentSlide == index
                //                 ? kPrimaryColor
                //                 : Colors.grey,
                //           ));
                //     }).toList()),
              ],
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
