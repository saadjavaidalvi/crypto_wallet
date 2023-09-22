import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:cryp_wallet/screens/home_screen.dart';
import 'package:cryp_wallet/screens/onboarding/import_multicoin_wallet.dart';
import 'package:cryp_wallet/screens/onboarding/passcode_screen.dart';
import 'package:cryp_wallet/helpers/my_shared_preferences.dart';
import 'package:cryp_wallet/services/crypto_services.dart';
import 'package:cryp_wallet/services/storage.dart';
import 'package:cryp_wallet/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialLandingPage extends StatelessWidget {
  const InitialLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text(
          '',
        ),
      ), */
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomAppBar(text: ''),
          _iconLogo(),
          _customTile(
            leadingIcon: const CircleAvatar(
              backgroundColor: ConstColors.black,
              child: IconButton(
                splashColor: Colors.transparent,
                onPressed: null,
                // color: Colors.black,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            text: "I don't have the wallet",
            subtitle: 'Create a new multi-chain wallet',
            onTap: () async {
              await createMnemonicAndProceed();
            },
          ),
          _customTile(
            text: 'I already have a wallet',
            subtitle: 'Import a wallet',
            leadingIcon: CircleAvatar(
              backgroundColor: ConstColors.black,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () async {
              await Get.to(
                const PasscodeScreen(
                  createNew: true,
                ),
              );
              bool exists = await MySharedPreference().passcodePinExists();
              if (exists) {
                Get.to(
                  const ImportMultiCoinWallet(),
                  transition: Transition.rightToLeft,
                );
              }
            },
          ),
          Container(
            height: 60,
          )
        ],
      ),
    );
  }

  Widget _iconLogo() {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(
              'assets/images/dxcTrade.png',
            ),
          ),
          Text(
            'Voz Wallet',
            style: pSemiBold20.copyWith(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              'Add border to card in Flutter, Inside the Card, you can specify the shape property',
              style: pSemiBold18.copyWith(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _customTile({
    String text = '',
    Widget? leadingIcon,
    String subtitle = '',
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Get.to(const PasscodeScreen());
          },
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
          left: 15,
          right: 15,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          // color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          subtitle: Text(
            subtitle,
          ),
          title: Text(
            text,
            style: pRegular14.copyWith(
              color: Colors.black,
            ),
          ),
          leading: AbsorbPointer(
            child: leadingIcon,
          ),
          trailing: const AbsorbPointer(
            child: IconButton(
              // color: Colors.black,
              icon: Icon(
                Icons.arrow_forward,
                color: ConstColors.grey,
              ),
              onPressed: null,
            ),
          ),
        ),
      ),
    );
  }

  Future createMnemonicAndProceed() async {
    await Get.to(
      const PasscodeScreen(
        createNew: true,
      ),
    );

    bool exists = await MySharedPreference().passcodePinExists();
    if (!exists) {
      return;
    }

    List<String> mnemonic = CryptoWalletServices.generateMnemonic();

    await MyStorage().saveMnemonic(mnemonic.toString());

    //! Need to change that to offAll to remove previous page
    Get.to(const HomePage());

    /* String encrpt = CryptoWalletServices.encryptMnemonic(
        mnemonic.toString(), '123456', generateRandomNonce(12));
    print(encrpt);
    String decrypt = CryptoWalletServices.decryptMnemonic(encrpt, '123456');
    print(decrypt); */
  }

  /* Uint8List generateRandomNonce(int length) {
    final random = Random.secure();
    final nonce = Uint8List(length);
    for (var i = 0; i < length; i++) {
      nonce[i] = random.nextInt(256); // Generate a random byte (0-255)
    }
    return nonce;
  } */
}
