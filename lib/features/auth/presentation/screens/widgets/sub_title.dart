import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_media_query.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaQueryOfWidth(context: context, multiBy: .04)),
      child: Text('Please sign in with your mail',style: Styles.style16,),
    );
  }
}
