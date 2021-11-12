import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../modules/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.deleteTx,
    required this.transaction,
  }) : super(key: key);

  final Function deleteTx;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
      child: ListTile(
        trailing: MediaQuery.of(context).size.width > 420
            ? TextButton.icon(
                onPressed: () => deleteTx(transaction.id),
                icon: Icon(Icons.delete, color: Colors.black),
                label: Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
              )
            : IconButton(
                splashColor: Colors.red,
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
              ),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                "UAH: ${transaction.amount.toStringAsFixed(2)}",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        ),
        subtitle: Text(
          DateFormat.yMMMEd().format(transaction.date),
          style: TextStyle(color: Colors.grey[500], fontSize: 16),
        ),
      ),
    );
  }
}
