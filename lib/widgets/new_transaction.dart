import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final miktarController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredMiktar = double.parse(miktarController.text);

    if (enteredTitle.isEmpty || enteredMiktar <= 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredMiktar,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 4,
        child: Container(
          height: 270,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Başlık'),
                controller: titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Miktar',),
                controller: miktarController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, right: 134),
                child: TextButton(
                  child: Text('Harcama ekle'),
                  onPressed: submitData,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber[200],
                    primary: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
