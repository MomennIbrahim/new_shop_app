import 'package:flutter/material.dart';
import 'package:route_app/core/constance.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/widgets/custom_media_query.dart';

class LoadingBanners extends StatelessWidget {
  const LoadingBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: highLightColorShimmer,
      baseColor: baseColorShimmer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17.5),
            color: Colors.grey,
          ),
          width: double.maxFinite,
          height: mediaQueryOfHeight(context: context, multiBy: 0.2),
        ),
      ),
    );
  }
}
