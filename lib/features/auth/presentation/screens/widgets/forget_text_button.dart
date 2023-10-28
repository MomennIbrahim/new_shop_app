import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_media_query.dart';

class ForgetTextButton extends StatelessWidget {
  const ForgetTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: mediaQueryOfWidth(context: context, multiBy: .04)),
      child: SizedBox(
        width: double.infinity,
        child: GestureDetector(
          onTap: (){
            print('Clicked');
          },
          child: Text(
          'Forgot password',
          textDirection: TextDirection.rtl,
          style: Styles.style18.copyWith(fontWeight: FontWeight.w400),
      ),
        ),
      ),
    );
  }
}
