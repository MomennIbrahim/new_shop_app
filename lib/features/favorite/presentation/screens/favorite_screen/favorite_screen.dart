import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_app/features/favorite/presentation/screens/favorite_screen/widgets/favorite_item.dart';
import '../../../../../core/widgets/custom_media_query.dart';
import '../../../../layout/presentation/screens/widgets/search_and_cart_row.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            height: mediaQueryOfHeight(context: context, multiBy: 0.05),
          ),
          SearchAndCartRow(),
          SizedBox(
            height: mediaQueryOfHeight(context: context, multiBy: .028),
          ),
          const FavoriteItem(),
        ],
      ),
    );
  }
}
