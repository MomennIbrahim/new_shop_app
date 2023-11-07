import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/core/utils/styles.dart';
import 'package:route_app/features/search/presentation/controller/search_cubit.dart';
import '../../../../../../core/widgets/custom_media_query.dart';
import '../../../../home/presentation/screen/details_screen/widgets/add_to_cart_button.dart';
import '../../../../home/presentation/screen/details_screen/widgets/price_text.dart';
import '../../../../home/presentation/screen/details_screen/widgets/product_name.dart';
import '../../../../home/presentation/screen/details_screen/widgets/route_logo_and_back_button.dart';

class SearchItemDetailsScreen extends StatefulWidget {
   SearchItemDetailsScreen({super.key, required this.index});

  final int index;
   int _currentSlide=0;

  @override
  State<SearchItemDetailsScreen> createState() => _CarouselBannersState();
}

class _CarouselBannersState extends State<SearchItemDetailsScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is GetSearchSuccessState) {
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
                      items:state
                          .searchModel
                          .data!
                          .data![widget.index]
                          .images!
                          .map((i) {
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: i.toString(),
                                  width: double.maxFinite,
                                  fit: BoxFit.fitHeight,
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
                            .searchModel.data!.data![widget.index].images!
                            .map((e) {
                          int index = state
                              .searchModel.data!.data![widget.index].images!
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
                      height: mediaQueryOfHeight(context: context, multiBy: 0.02),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    ProductName(
                      name: state.searchModel.data!.data![widget.index].name
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
                      state.searchModel.data!.data![widget.index].description
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
                        PriceText(price: 'EGP ${state.searchModel.data!.data![widget.index].price}'),
                        SizedBox(width: 10.w,),
                        AddToCartButton(model: state.searchModel.data!.data![widget.index].id,),

                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (state is GetSearchFailureState) {
            return Center(child: Text(state.errMessage.toString()));
          } else {
            return Center(child: Text('loading...',style: Styles.style20.copyWith(color: kPrimaryColor),));
          }
        },
      );
  }
}
