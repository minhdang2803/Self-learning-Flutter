import 'package:flutter/material.dart';
import 'package:udemy_project2/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: widget.transaction.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "No transactions",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
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
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      title: Text(
                        widget.transaction[index].title.toString(),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd()
                            .format(widget.transaction[index].date),
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 14,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () =>
                            setState(() => widget.transaction.removeAt(index)),
                      )),
                );
              },
              itemCount: widget.transaction.length,
            ),
    );
  }
}
