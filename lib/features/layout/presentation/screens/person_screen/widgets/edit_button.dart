import 'package:flutter/material.dart';

import '../../../../../../core/constance.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          onPressed();
        },
        icon: Icon(
          Icons.edit,
          color: kPrimaryColor,
        ));
  }
}
