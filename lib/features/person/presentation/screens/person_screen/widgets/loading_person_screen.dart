import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/constance.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/widgets/custom_media_query.dart';

class LoadingPersonScreen extends StatelessWidget {
  const LoadingPersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: mediaQueryOfHeight(context: context, multiBy: 0.02),
        bottom: mediaQueryOfHeight(context: context, multiBy: 0.004),
        right: mediaQueryOfWidth(context: context, multiBy: .045),
        left: mediaQueryOfWidth(context: context, multiBy: .045),
      ),
      child: SingleChildScrollView(
        child: Shimmer.fromColors(
          baseColor: baseColorShimmer,
          highlightColor: highLightColorShimmer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 45.0.r,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.grey,
                        height: 20.h,
                        width: 100.w,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        color: Colors.grey,
                        height: 20.h,
                        width: 120.w,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                color: Colors.grey,
                height: 20.h,
                width: 80.w,
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                color: Colors.grey,
                height: 45.h,
                width: double.infinity,
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                color: Colors.grey,
                height: 20.h,
                width: 80.w,
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                color: Colors.grey,
                height: 45.h,
                width: double.infinity,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                color: Colors.grey,
                height: 15.h,
                width: 130.w,
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Container(
                  color: Colors.grey,
                  height: 50.h,
                  width: double.maxFinite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
