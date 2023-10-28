import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/widgets/custom_media_query.dart';

class LoadingCategoriesListView extends StatelessWidget {
  const LoadingCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaQueryOfHeight(context: context, multiBy: .15),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade200,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index)=> const CircleAvatar(radius: 50,),
          separatorBuilder: (context,index)=> const SizedBox(width: 16.0,),
          itemCount: 5,
        ),
      ),
    );
  }
}
