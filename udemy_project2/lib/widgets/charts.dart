import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Charts extends StatelessWidget {
  List<Transaction> allTransaction;
  Charts(this.allTransaction);

  List<Map<String, Object>> get transactionsValues {
    return List.generate(7, (index) {
      final weekDate = DateTime.now().subtract(Duration(days: index));
      double sumOfMoney = 0;
      for (int i = 0; i < allTransaction.length; i++) {
        if (allTransaction[i].date.day == weekDate.day &&
            allTransaction[i].date.month == weekDate.month &&
            allTransaction[i].date.year == weekDate.month) {
          sumOfMoney += allTransaction[i].amount;
        }
      }
      return {
        'Date': DateFormat.E(),
        'Amount': sumOfMoney,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
