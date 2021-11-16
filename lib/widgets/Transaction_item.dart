// ignore_for_file: prefer_const_constructors, file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../modules/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.deleteTx,
    required this.transaction,
  }) : super(key: key);

  final Function deleteTx;
  final Transaction transaction;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  late Color _bgColor;
  @override
  void initState() {
    const availbleColors = [
      Colors.black,
      Colors.blue,
      Colors.purple,
      Colors.red
    ];
    _bgColor = availbleColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
      child: ListTile(
        trailing: MediaQuery.of(context).size.width > 420
            ? TextButton.icon(
                onPressed: () => widget.deleteTx(widget.transaction.id),
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
                onPressed: () => widget.deleteTx(widget.transaction.id),
              ),
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                "UAH: ${widget.transaction.amount.toStringAsFixed(2)}",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        ),
        subtitle: Text(
          DateFormat.yMMMEd().format(widget.transaction.date),
          style: TextStyle(color: Colors.grey[500], fontSize: 16),
        ),
      ),
    );
  }
}
