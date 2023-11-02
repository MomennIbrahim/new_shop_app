import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:route_app/core/utils/styles.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar(
      {super.key,
      required this.text,
      required this.searchFunction,
      required this.cartFunction});

  final String text;
  final Function searchFunction;
  final Function cartFunction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text,style: Styles.style20,),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              searchFunction();
            },
            icon: const Icon(IconlyLight.search)),
        IconButton(
            onPressed: () {
              cartFunction();
            },
            icon: const Icon(IconlyLight.buy)),
      ],
    );
  }
}
