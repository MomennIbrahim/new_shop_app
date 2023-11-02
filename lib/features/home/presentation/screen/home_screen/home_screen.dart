import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/core/widgets/custom_media_query.dart';
import 'package:route_app/features/home/presentation/screen/home_screen/widgets/carousel_banners.dart';
import 'package:route_app/features/home/presentation/screen/home_screen/widgets/categories_list_view.dart';
import 'package:route_app/features/home/presentation/screen/home_screen/widgets/gride_view_of_product.dart';
import 'package:route_app/features/home/presentation/screen/home_screen/widgets/see_all_row.dart';
import '../../../../layout/presentation/screens/widgets/search_and_cart_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
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
              height: mediaQueryOfHeight(context: context, multiBy: 0.05),
            ),
            SearchAndCartRow(),
            SizedBox(
              height: mediaQueryOfHeight(context: context, multiBy: 0.04),
            ),
            CarouselBanners(),
            SizedBox(
              height: mediaQueryOfHeight(context: context, multiBy: 0.03),
            ),
            SeeAllRow(onPressed: () {}),
            SizedBox(
              height: 144.h,
                child: const CategoriesListView()),

            Text(
              'Our Products',
              style: TextStyle(fontSize: 18.0.sp,color: kPrimaryColor),
            ),
            const GridViewOfProduct()
          ],
        ),
      ),
    );
  }
}
