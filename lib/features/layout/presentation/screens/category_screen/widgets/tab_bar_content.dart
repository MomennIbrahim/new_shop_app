import 'package:flutter/material.dart';
import 'package:route_app/features/layout/presentation/screens/category_screen/widgets/category_cover_image.dart';
import 'package:route_app/features/layout/presentation/screens/category_screen/widgets/category_grid_view.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_media_query.dart';

class TabBarContent extends StatelessWidget {
  const TabBarContent({
    super.key,
    required this.image,
    required this.title,
    required this.fashionTitleList,
    required this.fashionImageList,
    required this.fashionList,
  });

  final List<String> fashionTitleList;
  final List<String> fashionImageList;
  final int fashionList;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Styles.style14.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: mediaQueryOfHeight(context: context, multiBy: .021),
            ),
            CategoryCoverImage(title: title,image: image,),
            CategoryGridView(
              fashionImageList: fashionImageList,
              fashionTitleList: fashionTitleList,
              fashionList: fashionList,
            )
          ],
        ),
      ),
    );
  }
}
