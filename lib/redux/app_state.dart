import 'package:cryp_wallet/Models/coin_model.dart';

class AppState {
  List<Coin> coinList = [];
  AppState({
    List<Coin>? coinsList,
  }) {
    coinList = coinsList ?? [];
  }

  static AppState initial() {
    return AppState(
      coinsList: [],
    );
  }

  AppState copyWith({
    List<Coin>? coinList,
  }) {
    return AppState(
      coinsList: coinList ?? this.coinList,
    );
  }
}
