import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/widgets/custom_media_query.dart';

class RouteImage extends StatelessWidget {
  const RouteImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: mediaQueryOfHeight(context: context, multiBy: .1)),
      child: Center(child: SvgPicture.asset('assets/images/route.svg')),
    );
  }
}
