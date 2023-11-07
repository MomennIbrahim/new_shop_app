import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/features/home/presentation/controller/product_cubit/product_cubit.dart';
import 'package:route_app/features/search/data/model/search_model.dart';
import 'package:route_app/features/search/presentation/controller/search_cubit.dart';
import 'package:route_app/features/search/presentation/screens/widgets/search_add_cart_button.dart';
import 'package:route_app/features/search/presentation/screens/widgets/search_add_fav_button.dart';
import 'package:route_app/features/search/presentation/screens/widgets/search_item_details.dart';
import '../../../../../core/constance.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_media_query.dart';
import '../../../../../core/widgets/custom_navigator.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.searchModel, required this.index});

  final SearchModel searchModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customNavigator(
            context: context, widget: SearchItemDetailsScreen(index: index));
      },
      child: SizedBox(
        height: 113.h,
        width: double.maxFinite,
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: Styles.borderRadius15(),
                side: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.contain,
                      height: double.maxFinite,
                      width: mediaQueryOfWidth(context: context, multiBy: 0.2),
                      imageUrl: searchModel.data!.data![index].image!,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: mediaQueryOfHeight(
                                    context: context, multiBy: .02)),
                            child: Text(
                              searchModel.data!.data![index].name!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.style18
                                  .copyWith(color: const Color(0xff06004F)),
                            ),
                          ),
                          SizedBox(
                            height: mediaQueryOfHeight(
                                context: context, multiBy: .003),
                          ),
                          Text(
                            searchModel.data!.data![index].description!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Styles.style14.copyWith(color: kPrimaryColor),
                          ),
                          SizedBox(
                            height: mediaQueryOfHeight(
                                context: context, multiBy: .003),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'EGP ${searchModel.data!.data![index].price}',
                                  style: Styles.style14
                                      .copyWith(color: const Color(0xff06004F)),
                                ),
                                SearchAddFavButton(
                                    searchModel: searchModel, index: index),
                               SearchAddCartButton(searchModel: searchModel, index: index),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
