import 'package:cryp_wallet/Models/coin_model.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:cryp_wallet/screens/send_recieve_screens/recieve_currency_page.dart';
import 'package:cryp_wallet/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecieveCurrencyOptionList extends StatefulWidget {
  const RecieveCurrencyOptionList({super.key});

  @override
  State<RecieveCurrencyOptionList> createState() =>
      _RecieveCurrencyOptionListState();
}

class _RecieveCurrencyOptionListState extends State<RecieveCurrencyOptionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text('Recieve'),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ), */
      body: Column(
        children: [
          const CustomAppBar(
            text: "Recieve Amount",
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              top: 20,
            ),
            itemCount: coinList.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                onTap: () {
                  Get.to(const RecieveCurrencyScreen());
                  /* Get.to(
                    CryptoDetailPage(
                      coin: coinList[index],
                    ),
                  ); */
                },
                leading: Icon(
                  coinList[index].icon.icon,
                  size: 60,
                ),
                title: Text(
                  coinList[index].name,
                  style: pRegular14.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
                /* subtitle: Text(
                  coinList[index].rate,
                  style: pRegular14.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ), */
                trailing: Text(
                  coinList[index].total,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
