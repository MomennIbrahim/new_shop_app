import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_app/features/categories/presentation/screens/category_screen/widgets/loading_category_screen.dart';
import 'package:route_app/features/categories/presentation/screens/category_screen/widgets/tab_bar_content.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';
import '../../../../../../core/constance.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_media_query.dart';
import '../../../controller/categories_cubit/categories_cubit.dart';

class VerticalTabBar extends StatelessWidget {
  VerticalTabBar({super.key});

  final List<String> menFashionTitleList = [
    'T-shirts',
    'Shorts',
    'Jeans',
    'Pants',
    'Footwear',
    'Suits',
    'Watches',
    'Bags',
    'Eyewears',
  ];
  final List<String> menFashionImageList = [
    'https://m.media-amazon.com/images/I/41S+9swCRBL._AC_SX679_.jpg',
    'https://images.boardriders.com/globalGrey/rvca-products/all/default/xlarge/z4wkmcrvf1_rvca,f_8471_frt1.jpg',
    'https://eg.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/77/779423/1.jpg?5000',
    'https://shop.iravin.com/cdn/shop/files/o169753a_da2693c9-e06a-4665-850b-fa136a609f29_720x.jpg?v=1694689695',
    'https://rukminim2.flixcart.com/image/832/832/xif0q/shoe/z/w/b/6-la7458-6-layasa-white-original-imaghk9hwxbzejdw.jpeg?q=70',
    'https://happygentleman.com/wp-content/uploads/2019/11/mens-3-piece-blue-grey-vintage-suit-paul-andrew-victor.jpg',
    'https://m.media-amazon.com/images/I/81eMDGQJxkL._AC_SX679_.jpg',
    'https://m.media-amazon.com/images/I/71vkEmfAJkL._AC_SX679_.jpg',
    'https://static.payneglasses.com/media/wysiwyg/2023TagBanner/2023Men/PC-1280_1693815560838.jpg?rand=1693815561',
  ];
  final List<String> womenFashionTitleList = [
    'Dress',
    'Jeans',
    'Skirts',
    'pijamas',
    'Bags',
    'T-shirts',
    'Footwear',
    'Eyewears',
    'Watches',
  ];
  final List<String> womenFashionImageList = [
    'https://img.fruugo.com/product/9/41/359444419_max.jpg',
    'https://assets.ajio.com/medias/sys_master/root/20230201/0f83/63da4186f997dd708e3197c6/-473Wx593H-441316181-ltblue-MODEL.jpg',
    'https://i0.wp.com/shoptini.com/wp-content/uploads/2020/07/Shoptini-Takes-York-Blue-Floral-Skirt-12_websize.jpg?fit=665%2C930&ssl=1',
    'https://www.pajamagram.com/dw/image/v2/BDKM_PRD/on/demandware.static/-/Sites-master-catalog-vtb/default/dw75ba31a0/images/PJG/pjg-w1888-pinkgrayplaidbuttonfrontpj-petite-women-gkpj07589_main_20191001_0956.jpg?sw=600',
    'https://m.media-amazon.com/images/I/71sDF8OwNLL._AC_SY695_.jpg',
    'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1679356133-best-t-shirts-for-women-uniqlo-shirt-6418f0d218740.png?crop=1xw:1xh;center,top&resize=980:*',
    'https://img.fruugo.com/product/0/04/477733040_max.jpg',
    'https://i5.walmartimages.com/seo/VICOODA-Women-Men-Classic-Eyeglass-Frames-Eyewear-Optical-Plain-Clear-lens-Glasses_77649f0c-9071-43e2-82c4-2bf2f0c6c7fa.cc38756b4b1bf2cca750b16f50ec9439.jpeg?odnHeight=640&odnWidth=640&odnBg=FFFFFF',
    'https://eg.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/66/744963/1.jpg?1030',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CategoriesCubit.get(context);

        return BuildCondition(
          condition: state is! GetCategoriesLoadingState,
          builder: (context) => state is! GetCategoriesFailureState
              ? Expanded(
                  child: VerticalTabs(
                    indicatorColor: kPrimaryColor,
                    indicatorWidth: 4,
                    onSelect: (index) {
                      cubit.changeTabIndex(index);
                    },
                    changePageCurve: Curves.fastLinearToSlowEaseIn,
                    tabBackgroundColor: const Color(0xffEDF1F5),
                    contentScrollAxis: Axis.vertical,
                    tabsElevation: 5.0,
                    indicatorSide: IndicatorSide.start,
                    selectedTabBackgroundColor: Colors.transparent,
                    tabsWidth:
                        mediaQueryOfWidth(context: context, multiBy: .25),
                    tabs: cubit.categoriesModel1!.data.map((e) {
                      return tabCategory(categoryName: e.name.toString());
                    }).toList(),
                    contents: [
                      TabBarContent(
                          fashionImageList: menFashionImageList,
                          fashionTitleList: menFashionTitleList,
                          fashionList: menFashionTitleList.length,
                          image: cubit
                              .categoriesModel1!.data[cubit.currentIndex].image
                              .toString(),
                          title: cubit
                              .categoriesModel1!.data[cubit.currentIndex].name
                              .toString()),
                      TabBarContent(
                          fashionImageList: menFashionImageList,
                          fashionTitleList: menFashionTitleList,
                          fashionList: menFashionTitleList.length,
                          image: cubit
                              .categoriesModel1!.data[cubit.currentIndex].image
                              .toString(),
                          title: cubit
                              .categoriesModel1!.data[cubit.currentIndex].name
                              .toString()),
                      TabBarContent(
                          fashionList: womenFashionTitleList.length,
                          fashionImageList: womenFashionImageList,
                          fashionTitleList: womenFashionTitleList,
                          image: cubit
                              .categoriesModel1!.data[cubit.currentIndex].image
                              .toString(),
                          title: cubit
                              .categoriesModel1!.data[cubit.currentIndex].name
                              .toString()),
                      TabBarContent(
                          fashionList: womenFashionTitleList.length,
                          fashionImageList: womenFashionImageList,
                          fashionTitleList: womenFashionTitleList,
                          image: cubit
                              .categoriesModel1!.data[cubit.currentIndex].image
                              .toString(),
                          title: cubit
                              .categoriesModel1!.data[cubit.currentIndex].name
                              .toString()),
                      TabBarContent(
                          fashionImageList: menFashionImageList,
                          fashionTitleList: menFashionTitleList,
                          fashionList: menFashionTitleList.length,
                          image: cubit
                              .categoriesModel1!.data[cubit.currentIndex].image
                              .toString(),
                          title: cubit
                              .categoriesModel1!.data[cubit.currentIndex].name
                              .toString()),
                      TabBarContent(
                          fashionList: womenFashionTitleList.length,
                          fashionImageList: womenFashionImageList,
                          fashionTitleList: womenFashionTitleList,
                          image: cubit
                              .categoriesModel1!.data[cubit.currentIndex].image
                              .toString(),
                          title: cubit
                              .categoriesModel1!.data[cubit.currentIndex].name
                              .toString()),
                      TabBarContent(
                          fashionImageList: menFashionImageList,
                          fashionTitleList: menFashionTitleList,
                          fashionList: menFashionTitleList.length,
                          image: cubit
                              .categoriesModel1!.data[cubit.currentIndex].image
                              .toString(),
                          title: cubit
                              .categoriesModel1!.data[cubit.currentIndex].name
                              .toString()),
                      TabBarContent(
                          fashionList: womenFashionTitleList.length,
                          fashionImageList: womenFashionImageList,
                          fashionTitleList: womenFashionTitleList,
                          image: cubit
                              .categoriesModel1!.data[cubit.currentIndex].image
                              .toString(),
                          title: cubit
                              .categoriesModel1!.data[cubit.currentIndex].name
                              .toString()),
                      TabBarContent(
                          fashionImageList: menFashionImageList,
                          fashionTitleList: menFashionTitleList,
                          fashionList: menFashionTitleList.length,
                          image: cubit
                              .categoriesModel1!.data[cubit.currentIndex].image
                              .toString(),
                          title: cubit
                              .categoriesModel1!.data[cubit.currentIndex].name
                              .toString()),
                      TabBarContent(
                          fashionList: womenFashionTitleList.length,
                          fashionImageList: womenFashionImageList,
                          fashionTitleList: womenFashionTitleList,
                          image: cubit
                              .categoriesModel1!.data[cubit.currentIndex].image
                              .toString(),
                          title: cubit
                              .categoriesModel1!.data[cubit.currentIndex].name
                              .toString()),
                    ],
                  ),
                )
              : Center(child: Center(child: Text(cubit.failure1!.errMessage))),
          fallback: (context) =>
              const Center(child: LoadingCategoryScreen()),
        );
      },
    );
  }

  Tab tabCategory({required String categoryName}) {
    return Tab(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Text(
        categoryName,
        style: Styles.style14.copyWith(fontWeight: FontWeight.w500),
      ),
    ));
  }
}
