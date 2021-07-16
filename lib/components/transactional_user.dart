import 'dart:math';

import 'package:expenses/components/transactional_form.dart';
import 'package:expenses/components/transactional_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionalUser extends StatefulWidget {
  @override
  _TransactionalUserState createState() => _TransactionalUserState();
}

class _TransactionalUserState extends State<TransactionalUser> {

  final _transactions = [
    Transaction(id: 't1', title: 'Novo tenis de corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de luz', value: 100.30, date: DateTime.now()),
  ];

  _addTransactional(String title, double value) {
    final newTransactional = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now()
    );

    setState(() {
      _transactions.add(newTransactional);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionalForm(_addTransactional),
        TransactionList(transactions: _transactions,),
        
      ]
    );
  }
}