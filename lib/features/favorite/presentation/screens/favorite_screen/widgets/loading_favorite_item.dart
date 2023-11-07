import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/constance.dart';
import '../../../../../../core/utils/styles.dart';

class LoadingFavoriteItem extends StatelessWidget {
  const LoadingFavoriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: highLightColorShimmer,
      baseColor: baseColorShimmer,
      child: ListView.separated(
        itemBuilder: (context,index)=> SizedBox(
          width: double.maxFinite,
          height: 113.0.h,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: Styles.borderRadius15(),
            ),
          ),
        ),
        separatorBuilder: (context,index)=> SizedBox(height: 10.0.h,),
        itemCount: 4,
      ),
    );
  }
}
