import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/api.dart';
import 'package:wallet/wallet.dart' as wallet;
import 'package:pointycastle/export.dart' as pc;

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

  //////////////////////? ChatGPT //////////////////////
  String encryptMnemonic(String mnemonic, String pin, Uint8List nonce) {
    // Derive the encryption key using PBKDF2
    final keyDerivator = pc.PBKDF2KeyDerivator(
      pc.HMac(pc.SHA256Digest(), 64),
      /* iterationCount: 10000,
      derivedKeyLength: 32, */
    );
    keyDerivator.init(pc.Pbkdf2Parameters(nonce, nonce.length, 10000));
    final key = keyDerivator.process(Uint8List.fromList(utf8.encode(pin)));

    // Initialize AES-GCM cipher
    final gcm = pc.GCMBlockCipher(pc.AESFastEngine());
    final params =
        pc.AEADParameters(pc.KeyParameter(key), 96, nonce, Uint8List(0));
    gcm.init(true, params);

    // Encrypt the mnemonic
    final cipherText = gcm.process(Uint8List.fromList(utf8.encode(mnemonic)));

    // Combine the nonce and cipherText
    final result = Uint8List.fromList(nonce + cipherText);

    // Convert to base64 and return
    return base64Encode(result);
  }

  String decryptMnemonic(String encryptedMnemonic, String pin) {
    // Decode the base64 encoded string
    final decoded = base64Decode(encryptedMnemonic);

    // Extract the nonce and cipherText
    final nonce = decoded.sublist(0, 12);
    final cipherText = decoded.sublist(12);

    // Derive the decryption key using PBKDF2
    final keyDerivator = pc.PBKDF2KeyDerivator(
      pc.HMac(pc.SHA256Digest(), 64),
      /* iterationCount: 10000,
      derivedKeyLength: 32, */
    );
    keyDerivator.init(pc.Pbkdf2Parameters(nonce, nonce.length, 10000));
    final key = keyDerivator.process(Uint8List.fromList(utf8.encode(pin)));

    // Initialize AES-GCM cipher
    final gcm = pc.GCMBlockCipher(pc.AESFastEngine());
    final params =
        pc.AEADParameters(pc.KeyParameter(key), 96, nonce, Uint8List(0));
    gcm.init(false, params);

    // Decrypt the mnemonic
    final decrypted = gcm.process(Uint8List.fromList(cipherText));

    // Convert to string and return
    return utf8.decode(decrypted);
  }

  void changePin(String encryptedMnemonic, String oldPin, String newPin) {
    // Decrypt using the old PIN
    final decryptedMnemonic = decryptMnemonic(encryptedMnemonic, oldPin);

    // Generate a new random nonce for re-encryption
    SecureRandom secureRandom = SecureRandom();

    final newNonce = secureRandom.nextBytes(12); // pc.secureRandomBytes(12);

    // Encrypt using the new PIN
    final reEncryptedMnemonic =
        encryptMnemonic(decryptedMnemonic, newPin, newNonce);

    // Store the re-encrypted mnemonic securely
    // For demonstration, just printing it
    print("Re-encrypted Mnemonic with new PIN: $reEncryptedMnemonic");
  }

  //////////////////////? ChatGPT //////////////////////
}
