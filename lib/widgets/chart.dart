import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../modules/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);

  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }

      return {
        "day": DateFormat.E().format(weekDay).substring(0, 2),
        "amount": totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpeding {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: CharBar(
                  data["day"].toString(),
                  data["amount"] as double,
                  totalSpeding == 0
                      ? 0
                      : (data["amount"] as double) / totalSpeding),
            );
          }).toList(),
        ),
      ),
    );
  }
}
