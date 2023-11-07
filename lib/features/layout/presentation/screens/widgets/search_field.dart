import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/utils/styles.dart';
import 'package:route_app/core/widgets/custom_navigator.dart';
import 'package:route_app/features/search/presentation/screens/search_screen.dart';
import '../../../../../core/constance.dart';
import '../../../../../core/widgets/custom_media_query.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.searchController});

  final TextEditingController searchController ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          customNavigator(context: context, widget: SearchScreen());
        },
        child: Container(
          height: mediaQueryOfHeight(context: context, multiBy: .065),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(25.0.r),
            border: Border.all(color: kPrimaryColor)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                 Icon(IconlyLight.search,color: kPrimaryColor,),
                SizedBox(width: 10.w,),
                Text('Search',style:TextStyle(color: kPrimaryColor),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
