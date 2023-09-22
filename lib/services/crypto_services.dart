/* import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/api.dart';
import 'package:wallet/wallet.dart' as wallet;
import 'package:pointycastle/export.dart' as pc;
import 'package:bip39/bip39.dart' as bip39;

class CryptoWalletServices {
  List<String> mnemonic;
  String passphrase = "";
  CryptoWalletServices(this.mnemonic);

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
  static String encryptMnemonic(String mnemonic, String pin, Uint8List nonce) {
    // Derive the encryption key using PBKDF2
    final keyDerivator = pc.PBKDF2KeyDerivator(
      pc.HMac(pc.SHA256Digest(), 64),
      /* iterationCount: 10000,
      derivedKeyLength: 32, */
    );

    final pc.Pbkdf2Parameters pbkdf2Params =
        pc.Pbkdf2Parameters(nonce, nonce.length, 10000);

    keyDerivator.init(pbkdf2Params);
    late final Uint8List key;
    try {
      key = keyDerivator.process(Uint8List.fromList(utf8.encode(pin)));
    } catch (ex) {
      print(ex);
    }

    // Initialize AES-GCM cipher
    final pc.GCMBlockCipher gcm = pc.GCMBlockCipher(pc.AESEngine());
    final pc.AEADParameters params =
        pc.AEADParameters(pc.KeyParameter(key), 96, nonce, Uint8List(0));
    gcm.init(true, params);

    // Encrypt the mnemonic
    final Uint8List cipherText =
        gcm.process(Uint8List.fromList(utf8.encode(mnemonic)));

    // Combine the nonce and cipherText
    final Uint8List result = Uint8List.fromList(nonce + cipherText);

    // Convert to base64 and return
    return base64Encode(result);
  }

  static String decryptMnemonic(String encryptedMnemonic, String pin) {
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
    final gcm = pc.GCMBlockCipher(pc.AESEngine());
    final params =
        pc.AEADParameters(pc.KeyParameter(key), 96, nonce, Uint8List(0));
    gcm.init(false, params);

    // Decrypt the mnemonic
    final decrypted = gcm.process(Uint8List.fromList(cipherText));

    // Convert to string and return
    return utf8.decode(decrypted);
  }

  static void changePin(
      String encryptedMnemonic, String oldPin, String newPin) {
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
  ///
  ///
  static Future<bool> validateMnemonic(String mnemonic) async {
    // Remove leading/trailing whitespace
    mnemonic = mnemonic.trim();

    // Split the mnemonic phrase into words
    final List<String> words = mnemonic.split(' ');

    // Check if the mnemonic has the correct number of words (usually 12, 24, or 36 words)
    if (words.length != 12 && words.length != 24 && words.length != 36) {
      return false;
    }

    // Verify that each word is a valid BIP-39 word
    for (final word in words) {
      if (!bip39.validateMnemonic(word)) {
        return false;
      }
    }

    return true;
  }
}
 */
import 'dart:convert';
import 'package:http/http.dart';
import 'package:wallet/wallet.dart' as wallet;
import 'package:web3dart/web3dart.dart' as web3_dart;

import '../helpers/bip39_list.dart';

class CryptoWalletServices {
  List<String> mnemonic;
  String passphrase = "";
  String ethRPCUrl =
      'https://mainnet.infura.io/v3/6cf8813e536b4e8d8796838199830927';

  late web3_dart.Web3Client ethClient;

  CryptoWalletServices(this.mnemonic) {
    ethClient = web3_dart.Web3Client(ethRPCUrl, Client());
  }

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

  Future<String> transferETH(String receiverAddress, BigInt amount) async {
    String privateKey = "0x${getEthPrivateKey()}";
    final credentials = web3_dart.EthPrivateKey.fromHex(privateKey);
    String txHash = await ethClient.sendTransaction(
      credentials,
      web3_dart.Transaction(
        to: web3_dart.EthereumAddress.fromHex(receiverAddress),
        gasPrice: web3_dart.EtherAmount.inWei(amount),
        maxGas: 100000,
        value: web3_dart.EtherAmount.fromInt(web3_dart.EtherUnit.ether, 1),
      ),
      chainId: 1,
    );
    await ethClient.dispose();
    return txHash;
  }

  Future<String> transferERC20(String receiverAddress, BigInt amount,
      String tokenContractAddress) async {
    String privateKey = "0x${getEthPrivateKey()}";
    final credentials = web3_dart.EthPrivateKey.fromHex(privateKey);
    final contract = web3_dart.DeployedContract(
      web3_dart.ContractAbi.fromJson(
        '[{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_value","type":"uint256"}],"name":"approve","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transferFrom","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"}],"name":"balanceOf","outputs":[{"name":"balance","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transfer","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"},{"name":"_spender","type":"address"}],"name":"allowance","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"payable":true,"stateMutability":"payable","type":"fallback"},{"anonymous":false,"inputs":[{"indexed":true,"name":"owner","type":"address"},{"indexed":true,"name":"spender","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"from","type":"address"},{"indexed":true,"name":"to","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Transfer","type":"event"}]',
        'ERC20',
      ),
      web3_dart.EthereumAddress.fromHex(tokenContractAddress),
    );
    final function = contract.function('transfer');
    final txHash = await ethClient.sendTransaction(
      credentials,
      web3_dart.Transaction.callContract(
        contract: contract,
        function: function,
        parameters: [
          web3_dart.EthereumAddress.fromHex(receiverAddress),
          amount,
        ],
      ),
      chainId: 1,
    );

    await ethClient.dispose();
    return txHash;
  }

  Future<BigInt> getETHBalance() async {
    String address = getEthAddress();
    final balance = await ethClient.getBalance(
      web3_dart.EthereumAddress.fromHex(address),
    );
    await ethClient.dispose();
    return balance.getInWei;
  }

  Future<BigInt> getERC20Balance(String tokenContractAddress) async {
    String address = getEthAddress();
    final contract = web3_dart.DeployedContract(
      web3_dart.ContractAbi.fromJson(
        '[{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_value","type":"uint256"}],"name":"approve","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transferFrom","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"}],"name":"balanceOf","outputs":[{"name":"balance","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transfer","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"},{"name":"_spender","type":"address"}],"name":"allowance","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"payable":true,"stateMutability":"payable","type":"fallback"},{"anonymous":false,"inputs":[{"indexed":true,"name":"owner","type":"address"},{"indexed":true,"name":"spender","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"from","type":"address"},{"indexed":true,"name":"to","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Transfer","type":"event"}]',
        'ERC20',
      ),
      web3_dart.EthereumAddress.fromHex(tokenContractAddress),
    );
    final function = contract.function('balanceOf');
    final balance = await ethClient.call(
      contract: contract,
      function: function,
      params: [web3_dart.EthereumAddress.fromHex(address)],
    );
    await ethClient.dispose();
    return balance.first as BigInt;
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

  Future<BigInt> getTRXBalance() async {
    String address = getTronAddress();
    // send a request to tron api to get the balance
    var client = Client();
    try {
      BigInt balance = BigInt.zero;
      var response = await client.post(
        Uri.parse('https://api.trongrid.io/wallet/getaccount'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'accept': 'application/json'
        },
        body: jsonEncode({"address": address, "visible": true}),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data.isEmpty) {
          return BigInt.zero;
        }
        balance = BigInt.parse(data["balance"].toString());
      } else {}
      client.close();
      return balance;
    } catch (e) {
      client.close();
      // throw error
      rethrow;
    }
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

  Future<BigInt> getBtcBalance() async {
    final address = getBtcAddress();
    final url = 'https://chain.api.btc.com/v3/address/$address';
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 'success') {
        num balance = data['data']['balance'] as num;
        return BigInt.from(balance);
      } else {
        throw Exception('Error fetching BTC balance: ${data['message']}');
      }
    } else {
      throw Exception('Failed to fetch BTC balance');
    }
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

  static Future<bool> validateMnemonic(String mnemonic) async {
    // Remove leading/trailing whitespace
    mnemonic = mnemonic.trim();

    // Split the mnemonic phrase into words
    final List<String> words = mnemonic.split(' ');

    // Check if the mnemonic has the correct number of words (usually 12, 24, or 36 words)
    if (words.length != 12 && words.length != 24 && words.length != 36) {
      return false;
    }

    // Verify that each word is a valid BIP-39 word
    for (final word in words) {
      if (!bip39wordlist.contains(word)) {
        return false;
      }
      /* if (!bip39.validateMnemonic(word)) {
        return false;
      } */
    }

    return true;
  }
}
/* 
void main(List<String> arguments) async {
  final mnemonic = arguments[0].split(" ");
  final wallet = CryptoWalletServices(mnemonic);

  final balance = await wallet.getETHBalance();

  final balanceTRX = await wallet.getTRXBalance();

  final balanceUSDTERC20 = await wallet
      .getERC20Balance("0xdac17f958d2ee523a2206206994597c13d831ec7");

  final balanceBTC = await wallet.getBtcBalance();

  return;
}
 */