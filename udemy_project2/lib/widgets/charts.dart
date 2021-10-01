import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemy_project2/widgets/chart_bar.dart';
import '../models/transaction.dart';
import 'chart_bar.dart';

class Charts extends StatelessWidget {
  Charts(this.allTransaction);
  final List<Transaction> allTransaction;

  List<Map<String, Object>> get transactionsValues {
    return List.generate(7, (index) {
      final weekDate = DateTime.now().subtract(Duration(days: index));
      double sumOfMoney = 0;
      for (int i = 0; i < allTransaction.length; i++) {
        if (allTransaction[i].date.day == weekDate.day &&
            allTransaction[i].date.month == weekDate.month &&
            allTransaction[i].date.year == weekDate.year) {
          sumOfMoney += allTransaction[i].amount;
        }
      }
      return {
        'Date': DateFormat.E().format(weekDate).substring(0, 1),
        'Amount': sumOfMoney,
      };
    });
  }

  double get totalSpending {
    return transactionsValues.fold(
        0.0, (sum, item) => sum + (item['Amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    print(transactionsValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: transactionsValues.map((element) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: element['Date'].toString(),
                spendAmount: (element['Amount'] as double),
                spendingPercent: totalSpending == 0.0
                    ? 0.0
                    : (element['Amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
