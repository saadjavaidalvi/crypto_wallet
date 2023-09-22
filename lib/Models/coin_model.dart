import 'dart:core';

import 'package:cryp_wallet/redux/actions.dart';
import 'package:cryp_wallet/redux/app_state.dart';
import 'package:cryp_wallet/services/storage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../services/crypto_services.dart';

class Coin {
  late final String icon;
  late final String name;
  late final String total;
  late final String address;

  Coin({
    required this.icon,
    required this.name,
    required this.address,
    required this.total,
  });

  static Future initializeCoinListVariable(context) async {
    List<String> mnemunic = await MyStorage().getMnemonic();

    Store<AppState> state = StoreProvider.of<AppState>(context);

    BigInt btcBalance = (await CryptoWalletServices(mnemunic).getBtcBalance());

    BigInt ethBalance = (await CryptoWalletServices(mnemunic).getETHBalance());
    BigInt ercBalance = (await CryptoWalletServices(mnemunic)
        .getERC20Balance("0xdac17f958d2ee523a2206206994597c13d831ec7"));
    BigInt trxBalance = (await CryptoWalletServices(mnemunic).getTRXBalance());

    List<Coin> coinList = [
      Coin(
        icon: 'assets/icons/btc.png',
        name: 'BTC',
        total: btcBalance.toString(),
        address: CryptoWalletServices(mnemunic).getBtcAddress(),
      ),
      Coin(
        icon: 'assets/icons/eth.png',
        name: 'ETH',
        total: ethBalance.toString(),
        address: CryptoWalletServices(mnemunic).getEthAddress(),
      ),
      Coin(
        icon: 'assets/icons/usdt.png',
        name: 'USDT (ERC20)',
        total: (ercBalance.toDouble() / 1000000).toString(),
        address: CryptoWalletServices(mnemunic).getEthAddress(),
      ),
      Coin(
        icon: 'assets/icons/usdt.png',
        name: 'USDT (TRC20)',
        total: '0',
        /* CryptoWalletServices(mnemunic).get().toString() */
        address: CryptoWalletServices(mnemunic).getTronAddress(),
      ),
      Coin(
        icon: 'assets/icons/trx.png',
        name: "TRX",
        total: trxBalance.toString(),
        address: CryptoWalletServices(mnemunic).getTronAddress(),
      ),
    ];

    state.dispatch(UpdateCoinList(coinList));
  }
}
