import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/config/images.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:cryp_wallet/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class RecieveCurrencyScreen extends StatefulWidget {
  const RecieveCurrencyScreen({
    super.key,
    this.currency = '',
  });
  final String currency;

  @override
  State<RecieveCurrencyScreen> createState() => _RecieveCurrencyScreenState();
}

class _RecieveCurrencyScreenState extends State<RecieveCurrencyScreen> {
  bool isLoading = false;
  String magicLink = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            text: "Recieve ${widget.currency}",
          ),
          Expanded(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    padding: EdgeInsets.zero,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 30),
                          _qrWidget(),
                          const SizedBox(height: 20),
                          _addressWidget(),
                          const SizedBox(height: 20),
                        ],
                      )
                    ],
                  ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _qrWidget() {
    return Container(
      decoration: const BoxDecoration(
        color: ConstColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: QrImageView(
          data: magicLink,
          version: QrVersions.auto,
          size: 248,
        ),
      ),
    );
  }

  Widget _addressWidget() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: ConstColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Your ${widget.currency} Address",
                style: pSemiBold20.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                magicLink,
                style: pRegular14.copyWith(
                  fontSize: 16,
                  color: const Color(0xff9EA3AE),
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            _copyShareButton(),
          ],
        ),
      ),
    );
  }

  Widget _copyShareButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () async {
                await Clipboard.setData(
                  ClipboardData(
                    text: magicLink,
                  ),
                );
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    onVisible: () {},
                    content: Text(
                      "Copied",
                      style: pRegular14.copyWith(
                        color: ConstColors.white,
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: const Color(0xffF2F2F7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: SvgPicture.asset(
                        DefaultImages.p3,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Text(
                      "Copy",
                      style: pSemiBold20.copyWith(
                        fontSize: 17,
                        color: const Color(0xff9EA3AE),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Share.share(magicLink);
              },
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: const Color(0xffF2F2F7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: SvgPicture.asset(
                        DefaultImages.p16,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Text(
                      "Share",
                      style: pSemiBold20.copyWith(
                        fontSize: 17,
                        color: const Color(0xff9EA3AE),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
