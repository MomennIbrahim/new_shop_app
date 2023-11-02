import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/constance.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_media_query.dart';

class LoadingProductItems extends StatelessWidget {
  const LoadingProductItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        childAspectRatio:
        mediaQueryOfHeight(context: context, multiBy: .00077),
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:
      List.generate(4, (index) {
        return Shimmer.fromColors(
          baseColor: baseColorShimmer,
          highlightColor: highLightColorShimmer,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: Styles.borderRadius15()
            ),
          ),
        );
      }),
    );
  }
}
