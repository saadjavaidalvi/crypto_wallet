import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top + 15),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
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
              Text(
                text,
                style: pSemiBold18.copyWith(
                  fontSize: 24,
                ),
              ),
              const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
