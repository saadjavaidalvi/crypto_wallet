import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:cryp_wallet/screens/home_screen.dart';
import 'package:cryp_wallet/services/crypto_services.dart';
import 'package:cryp_wallet/services/storage.dart';
import 'package:cryp_wallet/widget/custom_button.dart';
import 'package:cryp_wallet/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ImportMnemonicWallet extends StatefulWidget {
  const ImportMnemonicWallet({super.key});

  @override
  State<ImportMnemonicWallet> createState() => _ImportMnemonicWalletState();
}

class _ImportMnemonicWalletState extends State<ImportMnemonicWallet> {
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
                /* 
                onChange: (va) {
                  // print(va);
                }, */
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
                  /* importPhrase(); */
                  importPhraseLocally();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future importPhraseLocally() async {
    String phrase = phraseC.text.trim().toLowerCase();

    bool isValid = await CryptoWalletServices.validateMnemonic(phrase);
    if (!isValid) {
      Fluttertoast.showToast(msg: 'Invalid Phrase');
      return;
    }

    await MyStorage().saveMnemonic(phrase);

    Get.to(
      const HomePage(),
    );
  }

  /* Future importPhrase() async {
    String phrase = phraseC.text.trim().toLowerCase();

    bool isValid = await CryptoWalletServices.validateMnemonic(phrase);
    if (!isValid) {
      Fluttertoast.showToast(msg: 'Invalid Phrase');
      return;
    }

    String pin = '123456'; /* await getBioMetricPin(); */

    String encrpt = CryptoWalletServices.encryptMnemonic(
        phrase, pin, generateRandomNonce(12));
    print(encrpt);
    String decrypt = CryptoWalletServices.decryptMnemonic(encrpt, pin);
    print(decrypt);
  }

  Uint8List generateRandomNonce(int length) {
    final random = Random.secure();
    final nonce = Uint8List(length);
    for (var i = 0; i < length; i++) {
      nonce[i] = random.nextInt(256); // Generate a random byte (0-255)
    }
    return nonce;
  } */
}
