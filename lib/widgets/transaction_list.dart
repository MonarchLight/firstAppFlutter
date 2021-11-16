import 'package:flutter/material.dart';

import './Transaction_item.dart';
import '../modules/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                SizedBox(
                    //height: 10,
                    ),
                Container(
                  height: constraints.maxHeight * 0.95,
                  child: Image.asset(
                    "assets/image/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView(
            children: [
              ...transactions
                  .map((e) => TransactionItem(
                        key: ValueKey(e.id),
                        deleteTx: deleteTx,
                        transaction: e,
                      ))
                  .toList()
            ],
          );

    /*ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                deleteTx: deleteTx,
                transaction: transactions[index],
              );
            },
            itemCount: transactions.length,
          )*/
  }
}
