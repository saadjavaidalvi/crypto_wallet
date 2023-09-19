import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/config/images.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:cryp_wallet/controller/splash_controller.dart';
import 'package:cryp_wallet/screens/onboarding/initial_landing_page.dart';
import 'package:cryp_wallet/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(
              () => Container(
                height: 240,
                width: Get.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      splashController.skip.value == 0
                          ? DefaultImages.o2
                          : DefaultImages.o1,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => Text(
                splashController.skip.value == 0
                    ? "Easy and Secure"
                    : "Exchages Coins",
                style: pSemiBold20.copyWith(
                  fontSize: 36,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => Text(
                splashController.skip.value == 0
                    ? "Cryptocurrencies impede the traceability\nof transactions making them a favorite."
                    : "Trade Bitcoin, Ethereum, USDT, and the\ntop altcoins on the legendary crypto.",
                style: pRegular14.copyWith(
                  fontSize: 16,
                  color: ConstColors.lightText,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => splashController.skip.value == 0
                      ? Container(
                          height: 9,
                          width: 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ConstColors.primary,
                          ),
                        )
                      : Container(
                          height: 9,
                          width: 9,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ConstColors.grey.withOpacity(0.40),
                          ),
                        ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Obx(
                  () => splashController.skip.value == 1
                      ? Container(
                          height: 9,
                          width: 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ConstColors.primary,
                          ),
                        )
                      : Container(
                          height: 9,
                          width: 9,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ConstColors.grey.withOpacity(0.40),
                          ),
                        ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Obx(
                  () => splashController.skip.value == 2
                      ? Container(
                          height: 9,
                          width: 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ConstColors.primary,
                          ),
                        )
                      : Container(
                          height: 9,
                          width: 9,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ConstColors.grey.withOpacity(0.40),
                          ),
                        ),
                ),
                /* Container(
                  height: 9,
                  width: 9,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ConstColors.greyColor.withOpacity(0.40),
                  ),
                ) */
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: "Next",
              color: ConstColors.primary,
              onTap: () {
                splashController.skip.value = splashController.skip.value + 1;
                if (splashController.skip.value >= 3) {
                  splashController.skip.value = 2;
                  Get.to(
                    const InitialLandingPage(),
                    transition: Transition.rightToLeft,
                  );
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
