import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function? addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enterTitle = titleController.text;
    final enterAmount = double.parse(amountController.text);
    if (enterAmount < 0) {
      return;
    } else {
      widget.addTx!(enterTitle, enterAmount);
    }
    Navigator.of(context).pop(); // close the popup after done input
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.63,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration:
                  InputDecoration(labelText: "Title", hintText: "Input Title"),
              controller: titleController,
              onChanged: (value) => print(titleController.text),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Amount", hintText: "Number of amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            Row(
              children: <Widget>[
                TextButton(
                  onPressed: null,
                  child: Text(
                    "Choose a date",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            // TextButton(
            //   child: Text("Add Transaction"),
            //   style: TextButton.styleFrom(primary: Colors.purple),
            //   onPressed: () => submitData,
            // ),
          ],
        ),
      ),
    );
  }
}
