import 'dart:async';

import 'package:cryp_wallet/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxInt skip = 0.obs;
  customInit({Widget? className}) {
    skip.value = 0;
    Timer(
      const Duration(seconds: 2),
      () {
        Get.offAll(
          () =>
              className ??
              // TabScreen(),
              const OnboardingScreen(),
          transition: Transition.rightToLeft,
        );
      },
    );
  }
}
