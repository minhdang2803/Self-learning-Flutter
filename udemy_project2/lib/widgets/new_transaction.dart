import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function? addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectDate;

  // Make a day Picker
  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null)
        return;
      else
        setState(() => _selectDate = date);
    });
  }

  // Get Data from User input;
  void _submitData() {
    final String enterTitle = _titleController.text;
    final enterAmount = double.parse(_amountController.text);
    if (enterAmount < 0 || enterTitle.isEmpty) {
      return;
    } else {
      widget.addTx!(
        enterTitle,
        enterAmount,
        _selectDate,
      );
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
              controller: _titleController,
              onChanged: (value) => print(_titleController.text),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Amount", hintText: "Number of amount"),
              controller: _amountController,
              keyboardType: TextInputType.number,
            ),
            Row(
              children: <Widget>[
                Text(
                  (_selectDate == null)
                      ? "No Date Choosen"
                      : DateFormat.yMEd().format(_selectDate!),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w300,
                  ),
                ),
                TextButton(
                  onPressed: _datePicker,
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
            ElevatedButton(
              child: Text("Add Transaction"),
              style: TextButton.styleFrom(primary: Colors.white),
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
