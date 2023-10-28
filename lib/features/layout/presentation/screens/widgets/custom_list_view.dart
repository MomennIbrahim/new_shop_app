import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_media_query.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.model,
  });

  final model;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: model.data.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            delay: const Duration(milliseconds: 200),
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: SizedBox(
                  width: mediaQueryOfWidth(context: context, multiBy: 0.2),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1.5,
                              color: Colors.black26,
                              spreadRadius: 1.5,
                            )
                          ],
                        ),
                        child: CircleAvatar(
                            radius: 50.0,
                            backgroundColor: Colors.white,
                            foregroundImage: CachedNetworkImageProvider(
                              model.data[index].image.toString(),
                            )),
                      ),
                      SizedBox(
                        height:
                            mediaQueryOfHeight(context: context, multiBy: .0001),
                      ),
                      Text(
                        '${model.data[index].name}',
                        style: Styles.style14,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 16.0,
        ),
      ),
    );
  }
}
