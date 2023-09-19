import 'package:cryp_wallet/Models/coin_model.dart';
import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:cryp_wallet/widget/base_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoDetailPage extends StatefulWidget {
  const CryptoDetailPage({
    super.key,
    required this.coin,
  });

  final Coin coin;

  @override
  State<CryptoDetailPage> createState() => _CryptoDetailPageState();
}

class _CryptoDetailPageState extends State<CryptoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              right: 20.0,
            ),
            decoration: BoxDecoration(
              color: Colors.blue[700]!,
            ),
            child: Padding(
              padding: const EdgeInsets.only(),
              child: Column(
                children: <Widget>[
                  AppBar(
                    shadowColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    centerTitle: false,
                    title: Text(widget.coin.name,
                        style: pRegular14.copyWith(
                          fontSize: 20,
                          color: ConstColors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "0 ETH",
                              style: pRegular14.copyWith(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            /* const SizedBox(height: 5.0),
                            Text(
                              widget.coin.name,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                              ),
                            ), */
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                BaseInkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                          radius: 30.0,
                                          backgroundColor: Colors.blue[400]!
                                              .withOpacity(0.4),
                                          child: const Icon(
                                            Icons.arrow_upward,
                                            color: Colors.white,
                                          )),
                                      const SizedBox(
                                        height: 7.0,
                                      ),
                                      const Text(
                                        'Send',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 30.0),
                                BaseInkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                          radius: 30.0,
                                          backgroundColor: Colors.blue[400]!
                                              .withOpacity(0.4),
                                          child: const Icon(
                                            Icons.arrow_downward,
                                            color: Colors.white,
                                          )),
                                      const SizedBox(height: 7.0),
                                      const Text(
                                        'Receive',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: ConstColors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Transactions',
                      style: pRegular14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          RefreshIndicator(
            color: ConstColors.primary,
            onRefresh: () async {
              return;
            },
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: coinList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    /* Get.to(
                      const CryptoDetailPage(),
                    ); */
                  },
                  // leading: Icon(
                  //   coinList[index].icon.icon,
                  //   size: 50,
                  // ),
                  title: Text(
                    coinList[index].name,
                    style: pSemiBold18.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  subtitle: Text(
                    coinList[index].rate,
                    style: pRegular14.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  trailing: Text(
                    coinList[index].total,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
