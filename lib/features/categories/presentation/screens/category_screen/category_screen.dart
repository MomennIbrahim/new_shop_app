import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_app/features/categories/presentation/screens/category_screen/widgets/vertical_tab_bar.dart';
import 'package:route_app/features/layout/presentation/screens/widgets/search_and_cart_row.dart';
import '../../../../../core/widgets/custom_media_query.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: mediaQueryOfHeight(context: context, multiBy: 0.06),
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
            height: mediaQueryOfHeight(context: context, multiBy: 0.03),
          ),
           VerticalTabBar(),
        ],
      ),
    );
  }
}
