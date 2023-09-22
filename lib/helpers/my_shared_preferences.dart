import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference {
  final String bioAuthenticationString = 'biometricAuthenticationStatus';
  final String loggedInString = 'loggedInStatusString';
  final String passCodeString = 'passCodePinString';
  final String mnemonicString = 'mnemonicPhraseString';

  //Initialize
  static late SharedPreferences sp;
  Future<void> init() async {
    sp = await SharedPreferences.getInstance();
  }

  Future saveLogIn(String userId) async {
    await sp.setBool(loggedInString, true);
  }

  Future savePasscodePin(String pin) async {
    await sp.setString(passCodeString, pin);
  }

  Future<bool> passcodePinExists() async {
    return sp.containsKey(passCodeString);
    // return sp.getString(passCodeString);
  }

  /* Future isValidPasscodePin() async {
    return sp.getString(passCodeString);
  } */

  Future saveMnemonic(List<String> mnemonic) {
    return sp.setStringList(mnemonicString, mnemonic);
  }

  /* Future saveTcpTransactions(List<TCPTransactionModel> tractions) async {
    await sp.setString(userIdString, jsonEncode(tractions));
  } */

  /* Future<List<TCPTransactionModel>> getTcpTransactions() async {
    return await jsonDecode(sp.getString(userIdString) ?? jsonEncode([]));
  } */

  /* Future saveTcpBalence() async {
    await sp.set
    // return await jsonDecode(sp.getString(userIdString) ?? jsonEncode([]));
  } */
/* 
  Future saveMagicAddress(String address) async {
    await sp.setString(userPublicAddress, address);
  }

  Future getMagicAddress() async {
    return sp.getString(userPublicAddress) ?? '';
  }
 */
  Future logout() async {
    await sp.clear();
  }
}
