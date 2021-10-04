import 'package:flutter/material.dart';
import 'package:udemy_project2/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transaction;
  final Function? removeFuctuion;
  final bool isLandscape;
  TransactionList(
      {required this.transaction,
      this.removeFuctuion,
      required this.isLandscape});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    /*
     * If the transaction list is empty -> print "No transaction" and a picture
     * Else: print the List of Transaction using ListTile
     */
    return widget.transaction.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "No transactions",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Container(
                    height: widget.isLandscape
                        ? constraints.maxHeight * 0.7
                        : constraints.maxHeight * 0.5,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return SizedBox(
                width: 300.0,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 30,
                      child: FittedBox(
                        child: Text(
                          '\$' +
                              widget.transaction[index].amount
                                  .toStringAsFixed(2),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    title: Text(
                      widget.transaction[index].title.toString(),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(widget.transaction[index].date),
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () =>
                          widget.removeFuctuion!(widget.transaction[index].id),
                    ),
                  ),
                ),
              );
            },
            itemCount: widget.transaction.length,
          );
  }
}
