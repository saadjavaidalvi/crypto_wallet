import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/text_style.dart';
import 'custom_button.dart';

class CustomDialoug {
  /// The dialoug shows when pro user comes back in app after 24 hours
  static Future welcomeDialougeForPro(BuildContext context) async {
    // if(balance > 0)
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          title: Text(
            'Welcome Back!',
            style: pSemiBold20.copyWith(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Free salary has been deposited to your address',
            style: pRegular14.copyWith(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: CustomButton(
                color: ConstColors.primary,
                onTap: () {
                  Navigator.pop(context);
                },
                text: 'Ok',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
              ),
            ),
          ],
        );
      },
    );
  }
}
