import 'package:cryp_wallet/Models/coin_model.dart';
import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:cryp_wallet/screens/crypto_detail_page.dart';
import 'package:cryp_wallet/screens/send_recieve_screens/recieve_currency_option_list.dart';
import 'package:cryp_wallet/screens/send_recieve_screens/send_currency_option_list_screen.dart';
import 'package:cryp_wallet/widget/base_inkwell.dart';
import 'package:flutter/material.dart';
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
  List<Coin> s = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Column(
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
                  onTap: () {},
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
                  onTap: () {},
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
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 20,
      ),
      itemCount: coinList.length,
      itemBuilder: (context, index) {
        return
            /* TransactionWidgetTile(
              time: DateTime.now(),
            ); */
            ListTile(
          onTap: () {
            Get.to(
              CryptoDetailPage(
                coin: coinList[index],
              ),
            );
          },
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                coinList[index].icon.icon,
                // size: 40,
                color: Colors.white,
              ),
            ),
          ),
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
    );
  }
}
