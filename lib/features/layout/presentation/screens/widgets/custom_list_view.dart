import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_media_query.dart';

class CustomListView extends StatelessWidget {
   CustomListView({
    super.key,
    required this.model,
  });

  final model;

  final List<String> images =[
    'https://bleuwire.com/wp-content/uploads/2019/03/laptop-accessories.jpg',
    'https://m.media-amazon.com/images/I/51L9N5xJu-L.__AC_SX300_SY300_QL70_ML2_.jpg',
    'https://e.huawei.com/-/mediae/images/solutions/enterprise-network/wlan-v1.jpg',
    'https://cdn.mos.cms.futurecdn.net/91b9e1fed3cc797650b42eefd0df94e5-970-80.jpg.webp',
    'https://media.cnn.com/api/v1/images/stellar/prod/i-stock-1287493837-1.jpg?c=16x9&q=h_720,w_1280,c_fill/f_webp',
    'https://www.digitaltrends.com/wp-content/uploads/2022/05/klipsch-reference-r800f-r40sa-r30c-r121sw.jpeg?fit=720%2C720&p=1',
    'https://bleuwire.com/wp-content/uploads/2019/03/laptop-accessories.jpg',
    'https://www.spacetv.co.za/wp-content/uploads/2022/02/D08DIY-PRO-LMXSMART-Combo-80cm-dish-with-Smart-LNBBracketAccessories.jpg',
    'https://www.spacetv.co.za/wp-content/uploads/2022/02/D08DIY-PRO-LMXSMART-Combo-80cm-dish-with-Smart-LNBBracketAccessories.jpg',
    'https://www.digitaltrends.com/wp-content/uploads/2022/05/klipsch-reference-r800f-r40sa-r30c-r121sw.jpeg?fit=720%2C720&p=1',
  ];

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
                              color: Colors.black12,
                              spreadRadius: 1.5,
                            )
                          ],
                        ),
                        child: CircleAvatar(
                            radius: 50.0,
                            backgroundColor: Colors.white,
                            foregroundImage: CachedNetworkImageProvider(
                              images[index],
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
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 16.0.w,
        ),
      ),
    );
  }
}
