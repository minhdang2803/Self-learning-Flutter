import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [];
  void _addNewTransaction(String txtitle, double txAmount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: txtitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() => _userTransaction.add(newTransaction));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
