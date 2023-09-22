import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:cryp_wallet/screens/home_screen.dart';
import 'package:cryp_wallet/services/storage.dart';
import 'package:cryp_wallet/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class PasscodeScreen extends StatefulWidget {
  const PasscodeScreen({
    super.key,
    this.createNew = false,
  });
  final bool createNew;

  @override
  State<PasscodeScreen> createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  String passCode = '';
  TextEditingController pinC = TextEditingController();
  String headerText = '';
  bool isConfirming = false;
  final _formKey = GlobalKey<FormState>();
  final String errorMessage = 'Please add a 6 digit the pin';

  @override
  void initState() {
    super.initState();
    headerText = widget.createNew ? "New Passcode" : "Enter Passcode";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).padding.top + 15),
                      Row(
                        children: [
                          !widget.createNew
                              ? Container()
                              : InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const CircleAvatar(
                                    radius: 18,
                                    backgroundColor: ConstColors.white,
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: ConstColors.fontColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        headerText,
                        style: pSemiBold20.copyWith(
                          fontSize: 26,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Passcode adds an extra layer of security when using the app",
                        style: pRegular14.copyWith(
                          fontSize: 14,
                          color: ConstColors.lightText,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Form(
                        key: _formKey,
                        child: Pinput(
                          length: 6,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          defaultPinTheme: PinTheme(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: ConstColors.grey,
                              ),
                            ),
                            textStyle: pSemiBold20.copyWith(
                              fontSize: 24,
                            ),
                          ),
                          controller: pinC,
                          focusedPinTheme: PinTheme(
                            height: 64,
                            width: 64,
                            textStyle: pSemiBold20.copyWith(
                              fontSize: 24,
                              color: ConstColors.white,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: ConstColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Column(
                children: [
                  CustomButton(
                    text: "Continue",
                    color: ConstColors.primary,
                    onTap: () async {
                      /* BiometricStorageFile storage = await BiometricStorage()
                          .getStorage('_authenticated',
                              options: StorageFileInitOptions());

                      await storage.write(
                        '123456',
                        promptInfo: PromptInfo.defaultValues,
                      );
                      String response = await storage.read() ?? '';

                      print(response);
                      return;
                      //! REMOVE LATER
                      Get.to(
                        const ImportMultiCoinWallet(),
                        transition: Transition.rightToLeft,
                      );
                      //! REMOVE LATER */

                      if (pinC.text.length < 6) {
                        Fluttertoast.showToast(msg: errorMessage);
                        return;
                      }

                      if (widget.createNew) {
                        if (isConfirming) {
                          String confirmPin = pinC.text;
                          if (confirmPin != passCode) {
                            Fluttertoast.showToast(
                                msg: 'Confirm Passcode doesn\'t match');
                            return;
                          }
                          await MyStorage().savePasscodePin(confirmPin);

                          Get.back();
                          return;
                        }
                        passCode = pinC.text;
                        pinC.text = '';
                        headerText = 'Confirm Passcode';
                        isConfirming = true;
                        setState(() {});
                        return;
                      }

                      String pin = pinC.text;

                      final String savedPasscode = MyStorage().getPasscodePin();
                      if (savedPasscode != pin) {
                        Fluttertoast.showToast(
                            msg: 'Invalid passcode. Please try again');
                        return;
                      }

                      //! Update the path to remove previous path
                      Get.to(
                        const HomePage(),
                        transition: Transition.rightToLeft,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
