import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/core/utils/styles.dart';
import 'package:route_app/features/checkout/presentation/screens/widgets/cutom_app_bar.dart';
import 'package:route_app/features/checkout/presentation/screens/widgets/order_info_item.dart';
import '../../../../core/widgets/custom_button.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const Expanded(
              child: Center(
                  child: Image(
                image: AssetImage('assets/images/basket.png'),
                width: double.maxFinite,
              )),
            ),
            SizedBox(
              height: 24.h,
            ),
            const OrderInfoItem(title: 'Order Subtotal', value: '\$42.97'),
            const OrderInfoItem(title: 'Discount', value: '0'),
            const OrderInfoItem(title: 'Shipping', value: '\$8'),
            SizedBox(
              height: 16.h,
            ),
            const Divider(),
            SizedBox(
              height: 15.h,
            ),
            OrderInfoItem(
              title: 'Total',
              value: '\$50.97',
              style: Styles.style24.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomButton(
              text: 'Complete Payment',
              onPressed: () {
                showModalBottomSheet(context: context, builder: (context){
                  return const PaymentMethodBottomSheet();
                } );
              },
              style: Styles.style22,
              buttonColor: kPrimaryColor,
            ),
            SizedBox(height: 10.h,)
          ],
        ),
      ),
    );
  }
}

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomButton(text: 'Continue', onPressed: (){}, style: Styles.style18,buttonColor: kPrimaryColor,),
          )
        ],
      ),
    );
  }
}

