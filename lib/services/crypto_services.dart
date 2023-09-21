import 'package:wallet/wallet.dart' as wallet;

class CryptoWallet {
  List<String> mnemonic;
  String passphrase = "";
  CryptoWallet(this.mnemonic);

  String getEthAddress() {
    final seed = wallet.mnemonicToSeed(mnemonic, passphrase: passphrase);
    final master = wallet.ExtendedPrivateKey.master(seed, wallet.xprv);
    final root = master.forPath("m/44'/60'/0'/0/0");

    final privateKey =
        wallet.PrivateKey((root as wallet.ExtendedPrivateKey).key);
    final publicKey = wallet.ethereum.createPublicKey(privateKey);
    final address = wallet.ethereum.createAddress(publicKey);
    return address;
  }

  wallet.PrivateKey getEthPrivateKey() {
    final seed = wallet.mnemonicToSeed(mnemonic, passphrase: passphrase);
    final master = wallet.ExtendedPrivateKey.master(seed, wallet.xprv);
    final root = master.forPath("m/44'/60'/0'/0/0");

    final privateKey =
        wallet.PrivateKey((root as wallet.ExtendedPrivateKey).key);
    return privateKey;
  }

  void transferETH(
      wallet.PrivateKey privateKey, String receiverAddress, BigInt amount) {
    throw UnimplementedError();
  }

  void transferERC20(wallet.PrivateKey privateKey, String receiverAddress,
      BigInt amount, int tokenID) {
    throw UnimplementedError();
  }

  String getTronAddress() {
    final seed = wallet.mnemonicToSeed(mnemonic, passphrase: passphrase);
    final master = wallet.ExtendedPrivateKey.master(seed, wallet.xprv);
    final root = master.forPath("m/44'/195'/0'/0/0");

    final privateKey =
        wallet.PrivateKey((root as wallet.ExtendedPrivateKey).key);
    final publicKey = wallet.tron.createPublicKey(privateKey);
    final address = wallet.tron.createAddress(publicKey);
    return address;
  }

  wallet.PrivateKey getTronPrivateKey() {
    final seed = wallet.mnemonicToSeed(mnemonic, passphrase: passphrase);
    final master = wallet.ExtendedPrivateKey.master(seed, wallet.xprv);
    final root = master.forPath("m/44'/195'/0'/0/0");

    final privateKey =
        wallet.PrivateKey((root as wallet.ExtendedPrivateKey).key);
    return privateKey;
  }

  void transferTRX(
      wallet.PrivateKey privateKey, String receiverAddress, BigInt amount) {
    throw UnimplementedError();
  }

  void transferUSDT(wallet.PrivateKey privateKey, String receiverAddress,
      BigInt amount, int tokenID) {
    throw UnimplementedError();
  }

  String getBtcAddress() {
    final seed = wallet.mnemonicToSeed(mnemonic, passphrase: passphrase);
    final master = wallet.ExtendedPrivateKey.master(seed, wallet.xprv);
    final root = master.forPath("m/84'/0'/0'/0/0");

    final privateKey =
        wallet.PrivateKey((root as wallet.ExtendedPrivateKey).key);

    final publicKey = wallet.bitcoinbech32.createPublicKey(privateKey);
    final address = wallet.bitcoinbech32.createAddress(publicKey);
    return address;
  }

  wallet.PrivateKey getBtcPrivateKey() {
    final seed = wallet.mnemonicToSeed(mnemonic, passphrase: passphrase);
    final master = wallet.ExtendedPrivateKey.master(seed, wallet.xprv);
    final root = master.forPath("m/44'/0'/0'/0/0");

    final privateKey =
        wallet.PrivateKey((root as wallet.ExtendedPrivateKey).key);
    return privateKey;
  }

  void transferBTC(
      wallet.PrivateKey privateKey, String receiverAddress, BigInt amount) {
    throw UnimplementedError();
  }

  // static mnemonic generate function
  static List<String> generateMnemonic() {
    List<String> mnemonic = wallet.generateMnemonic();
    return mnemonic;
  }
}
