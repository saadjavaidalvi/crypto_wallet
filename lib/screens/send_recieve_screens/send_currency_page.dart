import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:cryp_wallet/widget/custom_app_bar.dart';
import 'package:cryp_wallet/widget/custom_button.dart';
import 'package:cryp_wallet/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class SendCurrenyPage extends StatefulWidget {
  const SendCurrenyPage({super.key});

  @override
  State<SendCurrenyPage> createState() => _SendCurrenyPageState();
}

class _SendCurrenyPageState extends State<SendCurrenyPage> {
  TextEditingController addressC = TextEditingController();
  TextEditingController amountC = TextEditingController();
  TextEditingController memoC = TextEditingController();
  bool isLoading = false;
  // TAVTransactionsModel transactionsModel = TAVTransactionsModel();
  bool isUsd = false;
  String senderAdd = '';
  double usdRate = 0.0;
  // Store<AppState> store = StoreProvider.of<AppState>(GlobalContext.context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: CustomButton(
          text: "Send Email",
          color: ConstColors.primary,
          onTap: () async {
            // createTransaction();
          },
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  "Send Amount".toUpperCase(),
                  style: pSemiBold18.copyWith(
                    fontSize: 16,
                    color: ConstColors.white,
                  ),
                ),
        ),
      ),
      body: Column(
        children: [
          const CustomAppBar(
            text: "Send Amount",
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 20,
              right: 20,
            ),
            child: CustomTextField(
              text: "Address of the reciever",
              textEditingController: addressC,
              sufix: const SizedBox(),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: CustomTextField(
              text: "Please enter the amount",
              textEditingController: amountC,
              /* sufix: GestureDetector(
                  onTap: () {
                    isUsd = !isUsd;
                    setState(() {});
                  },
                  child: DropdownButton<String>(
                    items: <String>['TAV', 'USD'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: isUsd ? 'USD' : 'TAV',
                    onChanged: (value) {
                      if (value == "TAV") {
                        isUsd = false;
                        setState(() {});
                      } else {
                        isUsd = true;
                        setState(() {});
                      }
                    },
                  )
                  /* SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_drop_up,
                          size: 20,
                        ),
                        Text(
                          isUsd ? 'USD' : 'TAV',
                          style: pRegular14.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ), */
                  ), */
              keyboardType: TextInputType.number,
            ),
          ),
          /* amountC.text.trim().isEmpty
              ? Container()
              : double.tryParse(amountC.text.trim()) == null
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                              'Your amount will be ${isUsd ? (double.tryParse(amountC.text.trim())! / usdRate).toPrecision(8) : usdRate * double.tryParse(amountC.text.trim())!} in ${isUsd ? 'TAV' : 'USD'}'),
                        ],
                      ),
                    ), */
          /* Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 10,
              top: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    'Your TAV balance: ${store.state.tavWallet?.tavBalance ?? 0.0}',
                    style: pRegular14.copyWith(
                      color: Colors.grey,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ), */
          /* Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: CustomTextField(
              text: "Memo",
              textEditingController: memoC,
              sufix: const SizedBox(),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${memoC.text.trim().length}/255',
                  style: pRegular14.copyWith(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ) */
        ],
      ),
    );
  }

  /* bool allOkay() {
    bool isValid = isValidEthereumAddress(addressC.text.trim());
    if (!isValid) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid address')));
      return false;
    }
    if (amountC.text.trim().isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Amount is empty')));
      return false;
    }
    if (int.tryParse(amountC.text.trim()) == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid Amount')));
      return false;
    }
    if (int.tryParse(amountC.text.trim()) == 0) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Amount cannot be 0')));
      return false;
    }
    /* if (int.tryParse(amountC.text.trim()) != null) {
      double amountInTav = double.tryParse(amountC.text.trim())!;
      if (isUsd) {
        amountInTav = (double.tryParse(amountC.text.trim())! / usdRate);
        amountInTav = amountInTav.toPrecision(8);
      }

      if (amountInTav > store.state.tavBalance) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Insufficent balance',
            ),
          ),
        );
      }
      return false;
    } */
    return true;
  }

  void createTransaction() async {
    setState(() {
      isLoading = true;
    });
    if (!allOkay()) {
      setState(() {
        isLoading = false;
      });
      return;
    }
    await getSenderAddress();
    double amountInTav = double.tryParse(amountC.text.trim())!;
    if (isUsd) {
      amountInTav = (double.tryParse(amountC.text.trim())! / usdRate);
      amountInTav = amountInTav.toPrecision(8);
    }
    transactionsModel.amount = amountInTav;
    transactionsModel.recieverId = addressC.text.trim();
    transactionsModel.timestamp = Timestamp.fromMicrosecondsSinceEpoch(
        Timestamp.now().toDate().toUtc().microsecondsSinceEpoch);
    transactionsModel.senderId = senderAdd;
    transactionsModel.memo = memoC.text.trim();

    setState(() {
      isLoading = true;
    });

    String transaction =
        await TAVTransactionService().createTransaction(transactionsModel);
    setState(() {
      isLoading = false;
    });
    if (transaction.isNotEmpty) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(transaction),
        ),
      );
      return;
    }

    logger.d('object');
    Get.back();
  } */
}
