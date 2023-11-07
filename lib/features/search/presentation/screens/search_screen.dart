import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/utils/servic_locator.dart';
import 'package:route_app/features/favorite/presentation/screens/favorite_item_details_screen/widgets/route_logo_and_back_button.dart';
import 'package:route_app/features/search/data/repository/search_repository_implementation.dart';
import 'package:route_app/features/search/presentation/controller/search_cubit.dart';
import 'package:route_app/features/search/presentation/screens/widgets/search_list_view.dart';
import 'package:route_app/features/search/presentation/screens/widgets/search_text_field.dart';

import '../../../../core/widgets/custom_media_query.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});

 final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: mediaQueryOfHeight(context: context, multiBy: 0.06),
        bottom: mediaQueryOfHeight(context: context, multiBy: 0.004),
        right: mediaQueryOfWidth(context: context, multiBy: .045),
        left: mediaQueryOfWidth(context: context, multiBy: .045),
      ),
      child: Column(
        children: [
          const RouteLogoAndArrowBack(),
          SizedBox(height: 14.h,),
          SearchTextField(searchController: searchController),
          const SearchListView(),
        ],
      ),
    );
  }
}
