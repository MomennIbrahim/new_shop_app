// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:route_app/core/constance.dart';
// import 'package:route_app/core/utils/styles.dart';
// import 'package:route_app/core/widgets/custom_button.dart';
// import 'package:route_app/test/test_cubit.dart';
// import 'package:route_app/test/test_state.dart';
//
// import '../core/widgets/custom_media_query.dart';
// import '../features/layout/presentation/screens/home_screen/widgets/carousel_banners.dart';
// import '../features/layout/presentation/screens/home_screen/widgets/categories_list_view.dart';
// import '../features/layout/presentation/screens/home_screen/widgets/gride_view_of_product.dart';
// import '../features/layout/presentation/screens/home_screen/widgets/see_all_row.dart';
// import '../features/layout/presentation/screens/widgets/search_field.dart';
//
// class TestScreen extends StatelessWidget {
//   const TestScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => TestCubit(),
//       child: BlocConsumer<TestCubit, TestState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Scaffold(
//             body: Padding(
//                   padding: EdgeInsets.only(
//                     top: mediaQueryOfHeight(context: context, multiBy: 0.06),
//                     bottom: mediaQueryOfHeight(context: context, multiBy: 0.004),
//                     right: mediaQueryOfWidth(context: context, multiBy: .045),
//                     left: mediaQueryOfWidth(context: context, multiBy: .045),),
//                   child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                   SvgPicture.asset('assets/images/home-route.svg'),
//                   SizedBox(
//                     height: mediaQueryOfHeight(context: context, multiBy: 0.05),
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SearchField(searchController: searchController),
//                       IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.shopping_cart_outlined,
//                             color: kPrimaryColor,
//                           )),
//                     ],
//                   ),
//                   SizedBox(
//                     height: mediaQueryOfHeight(context: context, multiBy: 0.04),
//                   ),
//                   CarouselBanners(),
//                   SizedBox(
//                     height: mediaQueryOfHeight(context: context, multiBy: 0.03),
//                   ),
//                   SeeAllRow(onPressed: () {}),
//                   SizedBox(
//                       height: mediaQueryOfHeight(context: context, multiBy: .18),
//                       child: const CategoriesListView()),
//                   SizedBox(
//                     height: mediaQueryOfHeight(context: context, multiBy: 0.025),
//                   ),
//                   Text(
//                     'Our Products',
//                     style: Styles.style18.copyWith(color: kPrimaryColor),
//                   ),
//                   const Expanded(child: GridViewOfProduct())
//               ],
//             ),
//                 ),
//           );
//         },
//       ),
//     );
//   }
// }
