import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:route_app/core/utils/styles.dart';
import '../../core/constance.dart';
import '../auth/presentation/screens/sign_in_screen.dart';
import '../layout/presentation/screens/layout_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          splash: Text('Online Store',style: Styles.style24,),
          nextScreen:  token != null ? const LayoutScreen() : SignInScreen(),
          duration: 2500,
          backgroundColor: kPrimaryColor,
          splashTransition: SplashTransition.fadeTransition,
          animationDuration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
