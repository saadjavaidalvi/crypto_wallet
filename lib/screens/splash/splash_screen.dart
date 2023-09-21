import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/controller/splash_controller.dart';
import 'package:cryp_wallet/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/globals.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashController = Get.put(SplashController());

  @override
  void initState() {
    splashController.customInit(
      className: const OnboardingScreen(),
    );
    super.initState();
  }

  /* @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  Future checkLoginStatus() async {
    bool isLoggedIn =
        MySharedPreference.sp.getBool(MySharedPreference().loggedInString) ??
            false;
    bool hasEnabledBio = MySharedPreference.sp
            .getBool(MySharedPreference().bioAuthenticationString) ??
        false;

    if (isLoggedIn && hasEnabledBio) {
      // splashController.customInit(
      //     className: const BioMetricAuthenticationScreen());
    } else if (isLoggedIn) {
      // splashController.customInit(className: const TabScreen());
    } else {
      // splashController.customInit(className: const LandingScreen());
      // splashController.customInit();
    }

    // setState(() {});
  } */

  @override
  Widget build(BuildContext context) {
    GlobalContext().initalize(context);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Voz Wallet",
              style: GoogleFonts.poppins(
                fontSize: 45,
                fontWeight: FontWeight.w600,
                color: ConstColors.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
