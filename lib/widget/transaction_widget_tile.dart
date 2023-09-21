import 'package:cryp_wallet/config/colors.dart';
import 'package:cryp_wallet/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionWidgetTile extends StatelessWidget {
  final DateTime time;
  const TransactionWidgetTile({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return tcpTransactionWidgetList();
  }

  Widget tcpTransactionWidgetList(
      // TCPTransactionModel transaction,
      ) {
    // return DateFormat timeFormate = DateFormat('yyyy-MM-ddTHH:mm:ss');
    //     DateTime time =
    //         timeFormate.parse(transaction.metadata!.blockTimestamp!);
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            const SizedBox(
              height: 50,
              width: 50,
              child: Icon(
                /* address == transaction.from
                    ? Icons.arrow_upward
                    :  */
                Icons.arrow_downward,
                // color: address == transaction.from ? Colors.red : Colors.green,
                size: 30,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('dd MMMM yyyy').format(time.toLocal()),
                        style: pSemiBold18.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        DateFormat('hh:mma').format(time.toLocal()),
                        style: pRegular14.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '12.2',
                    style: pSemiBold18.copyWith(
                      fontSize: 14,
                      color: ConstColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
