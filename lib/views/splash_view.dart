import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:student_app_attandance/component/constants.dart';
import 'package:student_app_attandance/views/login_view.dart';
import 'package:student_app_attandance/views/part_animated.dart';

class SplachAnimated extends StatelessWidget {
  const SplachAnimated({super.key});
  static String id = 'Splach Animated';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.sizeTransition,
      splashIconSize: 300,
      backgroundColor: kPrimaryColor,
      splash: const InitalPage(),
      curve: Curves.easeInCirc,
      nextScreen: const LoginView(),
    );
  }
}
