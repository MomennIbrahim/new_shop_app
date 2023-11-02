import 'package:flutter/material.dart';
import 'package:route_app/features/layout/presentation/screens/widgets/search_field.dart';

import '../../../../../core/constance.dart';
import '../../../../../core/widgets/custom_navigator.dart';
import '../../../../cart/presentation/controller/cart_cubit.dart';
import '../../../../cart/presentation/screens/cart_screen.dart';

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
            onPressed: () {
              customNavigator(context: context, widget: const CartScreen());
              CartCubit.get(context).getCarts();
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: kPrimaryColor,
            )),
      ],
    );
  }
}
