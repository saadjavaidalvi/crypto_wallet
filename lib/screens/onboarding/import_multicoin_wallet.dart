import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:cryp_wallet/screens/home_screen.dart';
import 'package:cryp_wallet/widget/custom_button.dart';
import 'package:cryp_wallet/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ImportMultiCoinWallet extends StatefulWidget {
  const ImportMultiCoinWallet({super.key});

  @override
  State<ImportMultiCoinWallet> createState() => _ImportMultiCoinWalletState();
}

class _ImportMultiCoinWalletState extends State<ImportMultiCoinWallet> {
  TextEditingController nameC = TextEditingController();
  TextEditingController phraseC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text(
          'Import Multi-Coin Wallet',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Under Development",
                backgroundColor: ConstColors.grey,
                textColor: ConstColors.white,
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 1,
              );
            },
            icon: const Icon(
              Icons.qr_code_scanner,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextField(
                text: 'Name',
                textEditingController: nameC,
                keyboardType: TextInputType.name,
                borderColor: ConstColors.grey,
              ),
              Container(
                height: 24,
              ),
              /* 
              Text(
                'Phase',
                style: pRegular14,
              ), */
              CustomTextField(
                text: 'Phrase',
                textEditingController: phraseC,
                keyboardType: TextInputType.multiline,
                borderColor: ConstColors.grey,
                validator: (v1) {
                  return null;
                },
                onChange: (va) {
                  // print(va);
                },
                error: false,
                errorMessage: 'Error',
                inputFormatters: const [],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      'PASTE',
                      style: pSemiBold18.copyWith(
                        color: ConstColors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () async {
                      ClipboardData? data =
                          await Clipboard.getData('text/plain');
                      if (data != null &&
                          data.text != null &&
                          data.text!.isNotEmpty) {
                        phraseC.text = data.text!;
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
              Container(
                height: 32,
              ),
              const Text(
                'Typically 12 (sometimes 16, 24) words separated but single spaces',
              ),
              Container(
                height: 32,
              ),
              CustomButton(
                color: ConstColors.primary,
                text: 'Import',
                onTap: () {
                  Get.to(
                    const HomePage(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
