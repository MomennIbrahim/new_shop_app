import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/core/utils/styles.dart';
import 'package:route_app/core/widgets/custom_button.dart';
import 'package:route_app/features/checkout/presentation/screens/widgets/credit_card_info.dart';
import 'package:route_app/features/checkout/presentation/screens/widgets/payment_item_info.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: ShapeDecoration(
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 76.0),
              child: Text(
                'Thank you!',
                textAlign: TextAlign.center,
                style: Styles.style25,
              ),
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.styleWhite20,
            ),
            SizedBox(
              height: 42.h,
            ),
            const PaymentItemInfo(title: 'Date', value: '01/24/2023'),
            SizedBox(
              height: 20.h,
            ),
            const PaymentItemInfo(title: 'Time', value: '10:15 AM'),
            SizedBox(
              height: 20.h,
            ),
            const PaymentItemInfo(title: 'To', value: 'Sam Louis'),
            SizedBox(
              height: 24.h,
            ),
            const Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 24.h,
            ),
            PaymentItemInfo(
              title: 'Total',
              value: '\$50.97',
              style: Styles.style24,
            ),
            SizedBox(
              height: 30.h,
            ),
            const CreditCardInfo(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                    child: Icon(
                  FontAwesomeIcons.barcode,
                  color: Colors.white,
                      size: 50.0,
                )),
                Expanded(
                    child: CustomButton(
                  text: 'PAID',
                  onPressed: () {},
                  style: Styles.style24.copyWith(color: kPrimaryColor),
                )),
              ],
            ),
            SizedBox(height: 58.h,)
          ],
        ),
      ),
    );
  }
}
