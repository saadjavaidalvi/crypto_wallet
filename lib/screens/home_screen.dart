import 'package:cryp_wallet/Models/coin_model.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:cryp_wallet/screens/currenty_page.dart';
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
          decoration: BoxDecoration(color: Colors.blue[700]!),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 40,
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.notifications, color: Colors.white),
                    Icon(
                      Icons.sync_alt,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
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
                              color: Colors.white),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          '@JohnDoe',
                          style: TextStyle(fontSize: 15, color: Colors.white70),
                        ),
                        const SizedBox(height: 20.0),
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
                                      backgroundColor:
                                          Colors.blue[400]!.withOpacity(0.4),
                                      child: const Icon(
                                        Icons.arrow_upward,
                                        color: Colors.white,
                                      )),
                                  const SizedBox(height: 7.0),
                                  const Text('Send',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12))
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
                                      backgroundColor:
                                          Colors.blue[400]!.withOpacity(0.4),
                                      child: const Icon(
                                        Icons.arrow_downward,
                                        color: Colors.white,
                                      )),
                                  const SizedBox(height: 7.0),
                                  const Text('Receive',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12))
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
                                      backgroundColor:
                                          Colors.blue[400]!.withOpacity(0.4),
                                      child: const Icon(
                                        Icons.sell,
                                        color: Colors.white,
                                      )),
                                  const SizedBox(height: 7.0),
                                  const Text('Buy',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12))
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
                                    backgroundColor:
                                        Colors.blue[400]!.withOpacity(0.4),
                                    child: const Icon(
                                      Icons.energy_savings_leaf_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
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
                          ],
                        ),
                        const SizedBox(height: 20.0),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: coinList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Get.to(
                  CryptoDetailPage(
                    coin: coinList[index],
                  ),
                );
              },
              leading: Icon(
                coinList[index].icon.icon,
                size: 50,
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
        ),
      ],
    );
  }
}
