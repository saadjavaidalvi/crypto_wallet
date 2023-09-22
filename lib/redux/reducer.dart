import 'package:cryp_wallet/redux/actions.dart';

import 'app_state.dart';

AppState appReducer(AppState state, action) {
  if (action is UpdateCoinList) {
    return _updateCoinList(state, action);
  }

  return state;
}

AppState _updateCoinList(AppState status, UpdateCoinList action) {
  return status.copyWith(
    coinList: action.coinList,
  );
}
