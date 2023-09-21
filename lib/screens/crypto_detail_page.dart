import 'package:cryp_wallet/Models/coin_model.dart';
import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:cryp_wallet/screens/send_recieve_screens/recieve_currency_page.dart';
import 'package:cryp_wallet/screens/send_recieve_screens/send_currency_page.dart';
import 'package:cryp_wallet/widget/base_inkwell.dart';
import 'package:cryp_wallet/widget/custom_app_bar.dart';
import 'package:cryp_wallet/widget/transaction_widget_tile.dart';
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
            decoration: const BoxDecoration(
              color: ConstColors.primary,
            ),
            child: Column(
              children: [
                const CustomAppBar(
                  text: '',
                ),
                Container(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                    // top: 20,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Column(
                      children: <Widget>[
                        /* AppBar(
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      centerTitle: false,
                      title: Text(
                        widget.coin.name,
                        style: pRegular14.copyWith(
                          fontSize: 20,
                          color: ConstColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ), */
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
                                    child: Image.asset('assets/images/c2.png'),
                                  ),
                                  Text(
                                    "0 ETH",
                                    style: pRegular14.copyWith(
                                      fontSize: 35,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      BaseInkWell(
                                        onTap: () {
                                          Get.to(const SendCurrenyPage());
                                        },
                                        child: const Column(
                                          children: [
                                            CircleAvatar(
                                                radius: 30.0,
                                                backgroundColor:
                                                    ConstColors.secondary,
                                                child: Icon(
                                                  Icons.arrow_upward,
                                                  color: Colors.white,
                                                )),
                                            SizedBox(
                                              height: 7.0,
                                            ),
                                            Text(
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
                                        onTap: () {
                                          Get.to(const RecieveCurrencyScreen());
                                        },
                                        child: const Column(
                                          children: [
                                            CircleAvatar(
                                                radius: 30.0,
                                                backgroundColor:
                                                    ConstColors.secondary,
                                                child: Icon(
                                                  Icons.arrow_downward,
                                                  color: Colors.white,
                                                )),
                                            SizedBox(height: 7.0),
                                            Text(
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
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: ConstColors.secondary,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Transactions',
                      style: pRegular14.copyWith(
                        color: ConstColors.white,
                      ),
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
              padding: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
              ),
              itemCount: coinList.length,
              itemBuilder: (context, index) {
                return TransactionWidgetTile(
                  time: DateTime.now(),
                );
                /* ListTile(
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
                ); */
              },
            ),
          ),
        ],
      ),
    );
  }
}
