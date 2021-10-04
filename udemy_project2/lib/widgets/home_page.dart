import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_list.dart';
import 'new_transaction.dart';
import 'charts.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [];
  bool _allowSwitch = false;

  List<Transaction> get _getRecentTransactions {
    List<Transaction> newList = _userTransaction
        .where((element) => element.date.isAfter(
              DateTime.now().subtract(
                Duration(days: 7),
              ),
            ))
        .toList();
    return newList; // because where(() => ()) return an Iterable so we need to cast .toList();
  }

  void _addNewTransaction(
      String txtitle, double txAmount, DateTime chooseDate) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: txtitle,
      amount: txAmount,
      date: chooseDate,
    );
    setState(() => _userTransaction.add(newTransaction));
  }

  // Make Delete Transaction
  void _deleteTransaction(String id) {
    setState(
      () => _userTransaction.removeWhere((element) => element.id == id),
    );
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
          onTap: null,
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Lanscape checking
    bool _isLanscape = MediaQuery.of(context).orientation ==
        Orientation.landscape; // Check for the Orientation of Apps
    // AppBar
    final AppBar appBar = AppBar(
      title: Text('Personal Expenses',
          style: Theme.of(context).appBarTheme.titleTextStyle),
      actions: <Widget>[
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: Icon(Icons.add),
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (_isLanscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Show Charts"),
                  Switch(
                      value: _allowSwitch,
                      onChanged: (value) =>
                          setState(() => _allowSwitch = value))
                ],
              ),
            if (_isLanscape)
              (_allowSwitch == true)
                  ? Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      child: Charts(_getRecentTransactions),
                    )
                  : Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      child: TransactionList(
                        transaction: _userTransaction,
                        removeFuctuion: _deleteTransaction,
                        isLandscape: _isLanscape,
                      ),
                    ),
            if (_isLanscape == false)
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Charts(_getRecentTransactions),
              ),
            if (_isLanscape == false)
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.7,
                child: TransactionList(
                  transaction: _userTransaction,
                  removeFuctuion: _deleteTransaction,
                  isLandscape: _isLanscape,
                ),
              ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
