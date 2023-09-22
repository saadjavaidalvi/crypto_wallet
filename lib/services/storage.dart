import 'package:cryp_wallet/helpers/helper_methods.dart';
import 'package:cryp_wallet/helpers/my_shared_preferences.dart';

class MyStorage {
  Future saveMnemonic(String mnemonic) async {
    return await MySharedPreference.sp
        .setString(MySharedPreference().mnemonicString, mnemonic);
  }

  Future<List<String>> getMnemonic() async {
    String response =
        MySharedPreference.sp.getString(MySharedPreference().mnemonicString) ??
            "";

    List<String> list = HelperMethods().parseList(response);

    return list;
  }

  Future savePasscodePin(String confirmPin) async {
    await MySharedPreference().savePasscodePin(confirmPin);
  }

  String getPasscodePin() {
    return MySharedPreference.sp
            .getString(MySharedPreference().passCodeString) ??
        '';
  }
}
