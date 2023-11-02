import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_app/core/constance.dart';
import '../../../../../../core/widgets/custom_media_query.dart';
import '../../../controller/banner_cubit/banner_cubit.dart';
import 'loading_banners.dart';

class CarouselBanners extends StatefulWidget {
    CarouselBanners({super.key});

  int _currentSlide = 0;

  @override
  State<CarouselBanners> createState() => _CarouselBannersState();
}

class _CarouselBannersState extends State<CarouselBanners> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(
      builder: (context, state) {
        if(state is GetBannerSuccessState){
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      widget._currentSlide = index;
                    });
                  },
                  height: mediaQueryOfHeight(context: context, multiBy: 0.2),
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.7,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 6),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
                items: state.bannerModel.bannerData.map((i) {
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: state.bannerModel.bannerData.map((e) {
                    int index = state.bannerModel.bannerData.indexOf(e);
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
            ],
          );
        }else if(state is GetBannerFailureState){
          return Center(child: Text(state.errMessage.toString()));
        }else{
          return const LoadingBanners();
        }

      },
    );
  }
}
