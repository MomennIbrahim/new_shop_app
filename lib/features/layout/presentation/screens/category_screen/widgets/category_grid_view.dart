import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../../../core/widgets/custom_media_query.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    super.key,
    required this.fashionImageList,
    required this.fashionTitleList,
    required this.fashionList,
  });

  final List<String> fashionImageList;
  final List<String> fashionTitleList;
  final int fashionList;

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: mediaQueryOfHeight(context: context, multiBy: .0008),
      ),
      children: List.generate(fashionList, (index) {
        return  AnimationConfiguration.staggeredList(
          delay: const Duration(milliseconds: 200),
          position: index,
          duration: const Duration(milliseconds: 375),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: SlideAnimation(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                fashionImageList[index]),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(5.0)),
                    width: 70,
                    height: 70,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(fashionTitleList[index]),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
