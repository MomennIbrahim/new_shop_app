import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/constance.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_media_query.dart';
import 'category_shop_now_button.dart';

class CategoryCoverImage extends StatelessWidget {
  const CategoryCoverImage({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: CachedNetworkImage(
              width: double.infinity,
              fit: BoxFit.cover,
              height:
              mediaQueryOfHeight(context: context, multiBy: .15),
              imageUrl: image,
          ),
        ),
        Positioned(
          left: 16.0,
          top: 8.0,
          child: SizedBox(
            width: mediaQueryOfWidth(context: context, multiBy: 0.2),
            child: Text(
              title,
              style: Styles.style16.copyWith(
                  color: kPrimaryColor, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const ShopNowButton()
      ],
    );
  }
}
