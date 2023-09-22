import 'package:cryp_wallet/Models/coin_model.dart';
import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/controller/splash_controller.dart';
import 'package:cryp_wallet/screens/onboarding/onboarding_screen.dart';
import 'package:cryp_wallet/screens/onboarding/passcode_screen.dart';
import 'package:cryp_wallet/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../helpers/globals.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashController = Get.put(SplashController());

  @override
  void initState() {
    checkPasscodeStatus();

    /* splashController.customInit(
      className: const OnboardingScreen(),
    ); */
    super.initState();
  }

  Future checkPasscodeStatus() async {
    // await MySharedPreference.sp.clear();
    final String passcode = MyStorage().getPasscodePin();
    if (passcode.isEmpty) {
      splashController.customInit(
        className: const OnboardingScreen(),
      );
      return;
    }
    initializeAddressAndBalance();
    splashController.customInit(
      className: const PasscodeScreen(
        createNew: false,
      ),
    );
  }

  Future initializeAddressAndBalance() async {
    await Coin.initializeCoinListVariable(context);
  }

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
