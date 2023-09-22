import 'package:cryp_wallet/Models/coin_model.dart';
import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:cryp_wallet/redux/app_state.dart';
import 'package:cryp_wallet/screens/crypto_detail_page.dart';
import 'package:cryp_wallet/screens/send_recieve_screens/recieve_currency_option_list.dart';
import 'package:cryp_wallet/screens/send_recieve_screens/send_currency_option_list_screen.dart';
import 'package:cryp_wallet/widget/base_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum TabIndex {
  coins,
  finance,
  collectibles,
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    _getBtcBalance();
  }

  _getBtcBalance() async {
    // await CryptoWalletServices().getERC20Balance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              color: ConstColors.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10.0),
                  // topBar(),
                  headerContainer(),
                ],
              ),
            ),
          ),
          cryptoList(),
        ],
      ),
    );
  }

  Widget topBar() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.notifications, color: Colors.white),
        Icon(
          Icons.sync_alt,
          color: Colors.white,
        )
      ],
    );
  }

  Widget headerContainer() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: <Widget>[
          Column(children: [
            const SizedBox(height: 20.0),
            const Text(
              '\$0.00',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5.0),
            const Text(
              '@JohnDoe',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BaseInkWell(
                  onTap: () {
                    Get.to(const SendCurrencyOptionListScreen());
                  },
                  child: const Column(
                    children: [
                      CircleAvatar(
                          radius: 30.0,
                          backgroundColor: ConstColors.secondary,
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          )),
                      SizedBox(height: 7.0),
                      Text('Send',
                          style: TextStyle(color: Colors.white, fontSize: 12))
                    ],
                  ),
                ),
                const SizedBox(width: 30.0),
                BaseInkWell(
                  onTap: () {
                    Get.to(
                      const RecieveCurrencyOptionList(),
                    );
                  },
                  child: const Column(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: ConstColors.secondary,
                        child: Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 7.0),
                      Text('Receive',
                          style: TextStyle(color: Colors.white, fontSize: 12))
                    ],
                  ),
                ),
                const SizedBox(width: 30.0),
                BaseInkWell(
                  onTap: () {
                    Fluttertoast.showToast(msg: 'Under Development');
                  },
                  child: const Column(
                    children: [
                      CircleAvatar(
                          radius: 30.0,
                          backgroundColor: ConstColors.secondary,
                          child: Icon(
                            Icons.sell,
                            color: Colors.white,
                          )),
                      SizedBox(height: 7.0),
                      Text('Buy',
                          style: TextStyle(color: Colors.white, fontSize: 12))
                    ],
                  ),
                ),
                const SizedBox(width: 30.0),
                BaseInkWell(
                  onTap: () {
                    Fluttertoast.showToast(msg: 'Under Development');
                  },
                  child: const Column(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: ConstColors.secondary,
                        child: Icon(
                          Icons.energy_savings_leaf_rounded,
                          color: Colors.white,
                        ),
                      ),
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
              ],
            ),
            const SizedBox(height: 20.0),
          ]),
        ],
      ),
    );
  }

  Widget cryptoList() {
    return StoreConnector<AppState, List<Coin>>(
        converter: (store) => store.state.coinList,
        builder: (context, List<Coin> coinList) {
          return coinList.isEmpty
              ? const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: ConstColors.primary,
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 20,
                  ),
                  itemCount: coinList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 15,
                          ),
                          onTap: () async {
                            /* List<String> mnemunic =
                                await MyStorage().getMnemonic();
                            BigInt ercBalance = (await CryptoWalletServices(
                                    mnemunic)
                                .getERC20Balance(
                                    "0xdac17f958d2ee523a2206206994597c13d831ec7"));
                            double value = ercBalance.toDouble() / 1000000;
                            print(value); */
                            /* EtherAmount etherAmount = EtherAmount.fromBigInt(
                                EtherUnit.wei, btcBalance); */
                            // print(etherAmount.getInWei);
                            Get.to(
                              CryptoDetailPage(
                                coin: coinList[index],
                              ),
                            );
                          },
                          title: Text(
                            coinList[index].name,
                            style: pSemiBold18.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              coinList[index].icon,
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          trailing: Text(
                            coinList[index].total,
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                );
        });
  }
}
