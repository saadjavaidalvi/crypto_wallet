import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:cryp_wallet/screens/onboarding/passcode_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialLandingPage extends StatelessWidget {
  const InitialLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text(
          '',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _iconLogo(),
          _customTile(
            leadingIcon: const CircleAvatar(
              backgroundColor: ConstColors.grey,
              child: IconButton(
                splashColor: Colors.transparent,
                onPressed: null,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            text: "I don't have the wallet",
            subtitle: 'Create a new multi-chain wallet',
            onTap: () async {
              await Get.to(
                const PasscodeScreen(
                  createNew: true,
                ),
              );
            },
          ),
          _customTile(
            text: 'I already have a wallet',
            subtitle: 'Import a wallet',
            leadingIcon: CircleAvatar(
              backgroundColor: Colors.grey,
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
              'assets/images/c2.png',
            ),
          ),
          Text(
            'Trust',
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
}
