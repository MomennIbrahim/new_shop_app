import 'package:flutter/material.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/core/widgets/custom_navigator.dart';
import 'package:route_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:route_app/features/layout/presentation/screens/layout_screen.dart';

import '../../core/utils/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

        Future.delayed(
      const Duration(seconds: 3),
      () => customNavigatorAndReplacement(
          context: context,
          widget: token != null ? const LayoutScreen() : SignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          image: const DecorationImage(
              image: AssetImage('assets/images/Splash Screen.png'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
