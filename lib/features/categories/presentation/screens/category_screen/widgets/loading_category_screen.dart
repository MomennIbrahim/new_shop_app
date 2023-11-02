import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/core/utils/styles.dart';
import 'package:route_app/core/widgets/custom_media_query.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCategoryScreen extends StatelessWidget {
  const LoadingCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 50.h),
        child: Row(
          children: [
            Expanded(
              child: Shimmer.fromColors(
                baseColor: baseColorShimmer,
                highlightColor: highLightColorShimmer,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: kPrimaryColor,width: 10.0),
                    borderRadius: Styles.borderRadius15(
                        topLeft: 15.0, topRight: 0.0, bottomRight: 0.0),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Shimmer.fromColors(
                baseColor: baseColorShimmer,
                highlightColor: highLightColorShimmer,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
