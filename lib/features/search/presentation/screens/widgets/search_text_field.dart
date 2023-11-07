import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:route_app/features/search/presentation/controller/search_cubit.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class SearchTextField extends StatelessWidget {
   const SearchTextField({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: searchController,
      prefixIcon: const Icon(IconlyLight.search),
      keyBoardType: TextInputType.text,
      hasSuffixIcon: false,
      hasOnSubmitted: true,
      labelText: 'Search',
      validatorText: '',
      onFieldSubmitted: (){
        SearchCubit.get(context).getSearchData(searchText: searchController.text);
      },
    );
  }
}
