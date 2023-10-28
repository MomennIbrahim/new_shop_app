// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../features/layout/presentation/screens/widgets/search_field.dart';
// import '../constance.dart';
// import 'custom_media_query.dart';
//
// class CustomCircularProgressIndicator extends StatelessWidget {
//   const CustomCircularProgressIndicator({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: mediaQueryOfHeight(context: context, multiBy: .15),
//       child: Shimmer.fromColors(
//         baseColor: Colors.grey.shade300,
//         highlightColor: Colors.grey.shade200,
//         child: Column(
//           children: [
//             SizedBox(
//               height: mediaQueryOfHeight(context: context, multiBy: 0.05),
//             ),
//             SvgPicture.asset('assets/images/home-route.svg'),
//             SizedBox(
//               height: mediaQueryOfHeight(context: context, multiBy: 0.05),
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50.0),
//                     color: Colors.grey,
//                   ),
//                   width: double.maxFinite,
//                   height: 100,
//                 ),
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.shopping_cart_outlined,
//                       color: kPrimaryColor,
//                     )),
//               ],
//             ),
//             SizedBox(
//               height: mediaQueryOfHeight(context: context, multiBy: .3),
//               child: Shimmer.fromColors(
//                 baseColor: Colors.grey.shade300,
//                 highlightColor: Colors.grey.shade200,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     color: Colors.grey,
//                   ),
//                   width: double.maxFinite,
//                   height: 300,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context,index)=> const CircleAvatar(radius: 50,),
//                 separatorBuilder: (context,index)=> const SizedBox(width: 16.0,),
//                 itemCount: 5,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
