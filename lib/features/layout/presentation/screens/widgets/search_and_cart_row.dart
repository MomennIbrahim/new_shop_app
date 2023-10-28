import 'package:flutter/material.dart';
import 'package:route_app/features/layout/presentation/screens/widgets/search_field.dart';

import '../../../../../core/constance.dart';

class SearchAndCartRow extends StatelessWidget {
   SearchAndCartRow({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchField(searchController: searchController),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: kPrimaryColor,
            )),
      ],
    );
  }
}
