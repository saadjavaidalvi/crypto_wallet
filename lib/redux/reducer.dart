// import 'package:currency/redux/actions.dart';
// import 'package:currency/utils/my_shared_preferences.dart';

// import 'app_state.dart';

// AppState appReducer(AppState state, action) {
//   if (action is UpdateProfile) {
//     return _updateProfile(state, action);
//   } else if (action is UpdateUsdRate) {
//     return _updateUsdRate(state, action);
//   } else if (action is UpdateTAVTransaction) {
//     return _updateTavTransactions(state, action);
//   } else if (action is UpdatePublicAddress) {
//     return _setPublicAddress(state, action);
//   } else if (action is UpdateTavBalance) {
//     return _updateTavBalance(state, action);
//   } else if (action is UpdateTcpBalance) {
//     return _updateTcpBalance(state, action);
//   } else if (action is UpdateNotifications) {
//     return _updateNotifications(state, action);
//   } /* else if (action is UpdateReferCode) {
//     return _updateRefCode(state, action);
//   }  */
//   else if (action is UpdateTCPTransaction) {
//     return _updateTcpTransactions(state, action);
//   } else if (action is UpdateTavWallet) {
//     return _updateTavWallet(state, action);
//   } else if (action is UpdateCouponList) {
//     return _updateCouponList(state, action);
//   }

//   return state;
// }

// AppState _updateCouponList(AppState status, UpdateCouponList action) {
//   return status.copyWith(
//     couponsList: action.couponModelList,
//   );
// }

// AppState _updateTavWallet(AppState status, UpdateTavWallet action) {
//   return status.copyWith(
//     tavWallet: action.tavWallet,
//   );
// }

// AppState _updateProfile(AppState state, UpdateProfile action) {
//   return state.copyWith(
//     profile: action.profile,
//   );
// }

// AppState _updateUsdRate(AppState state, UpdateUsdRate updateUsdRate) {
//   return state.copyWith(
//     usdRate: updateUsdRate.rate,
//   );
// }

// AppState _updateTavTransactions(
//     AppState state, UpdateTAVTransaction updateTAVTransaction) {
//   return state.copyWith(
//     tavTransactions: updateTAVTransaction.transactions,
//   );
// }

// AppState _updateTcpTransactions(
//     AppState state, UpdateTCPTransaction updateTcpTransaction) {
//   return state.copyWith(
//     tcpTransactions: updateTcpTransaction.transactions,
//   );
// }

// AppState _setPublicAddress(
//     AppState state, UpdatePublicAddress setPublicAddress) {
//   MySharedPreference().saveMagicAddress(setPublicAddress.address);
//   return state.copyWith(
//     publicAddress: setPublicAddress.address,
//   );
// }

// AppState _updateTavBalance(AppState state, UpdateTavBalance updateTavBalance) {
//   return state.copyWith(
//     tavBalance: updateTavBalance.balance,
//   );
// }

// AppState _updateTcpBalance(AppState state, UpdateTcpBalance updateTcpBalance) {
//   return state.copyWith(
//     tcpBalance: updateTcpBalance.etherAmount,
//   );
// }

// AppState _updateNotifications(
//     AppState state, UpdateNotifications updateNotifications) {
//   return state.copyWith(
//     notificationList: updateNotifications.notificationList,
//   );
// }

// /* AppState _updateRefCode(AppState state, UpdateReferCode updateReferCode) {
//   return state.copyWith(
//     refCode: updateReferCode.referCode,
//   );
// } */
