import 'package:cryp_wallet/Models/coin_model.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:cryp_wallet/redux/app_state.dart';
import 'package:cryp_wallet/screens/send_recieve_screens/send_currency_page.dart';
import 'package:cryp_wallet/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';

class SendCurrencyOptionListScreen extends StatefulWidget {
  const SendCurrencyOptionListScreen({super.key});

  @override
  State<SendCurrencyOptionListScreen> createState() =>
      _SendCurrencyOptionListScreenState();
}

class _SendCurrencyOptionListScreenState
    extends State<SendCurrencyOptionListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text(
          'Send',
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ), */
      body: StoreConnector<AppState, List<Coin>>(
          converter: (store) => store.state.coinList,
          builder: (context, List<Coin> coinList) {
            return Column(
              children: [
                const CustomAppBar(
                  text: "Send Amount",
                ),
                ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
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
                          onTap: () {
                            Get.to(
                              const SendCurrenyPage(
                                  // coin: coinList[index],
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
                ),
              ],
            );
          }),
    );
  }

  /* _customList() {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        'BNB Beacon',
        style: pRegular14,
      ),
    );
  } */
}
