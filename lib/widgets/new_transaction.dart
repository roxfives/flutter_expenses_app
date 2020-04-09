import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function _addTransaction;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this._addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => onSubmit(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: onSubmit,
            )
          ],
        ),
      ),
    );
  }

  void onSubmit() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isNotEmpty && enteredAmount > 0) {
      _addTransaction(
        enteredTitle,
        enteredAmount,
      );
    }
  }
}
