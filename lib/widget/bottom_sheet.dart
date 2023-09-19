import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;

  final String description;

  const CustomBottomSheet({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        color: ConstColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: pSemiBold18.copyWith(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Divider(
              color: ConstColors.grey.withOpacity(0.5),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 270,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  Text(
                    description,
                    style: pSemiBold18.copyWith(
                      fontSize: 17,
                      color: ConstColors.secondary.withOpacity(.6),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
