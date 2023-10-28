import 'package:flutter/material.dart';
import '../../../../../core/constance.dart';
import '../../../../../core/widgets/custom_media_query.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.searchController});

  final TextEditingController searchController ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: mediaQueryOfHeight(context: context, multiBy: .065),
        child: TextFormField(
            controller: searchController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(15.0),
              ),
              hintText: 'Search',
              prefixIcon: Icon(
                Icons.search,
                color: kPrimaryColor,
              ),
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(25.0),
              ),
            )),
      ),
    );
  }
}
