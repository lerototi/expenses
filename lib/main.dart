import 'dart:math';

import 'package:expenses/components/transactional_form.dart';
import 'package:flutter/material.dart';

import 'components/transactional_list.dart';
import 'models/transaction.dart';
main() => runApp(ExpensesApp());

class ExpensesApp extends  StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage()
      );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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


  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context, 
      builder: (_) {
        return TransactionalForm(_addTransactional);
      });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
      title: Text("Despesas Pessoais"),
      actions: [
        IconButton(
          onPressed: () => _openTransactionFormModal(context), 
          icon: Icon(Icons.add))
      ],
      ),
      body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Container(
              child: Card(
        child: Text("Grafico"),
        elevation: 5,
        color: Colors.blue,
              ),
            ),
              TransactionList(transactions: _transactions,),
          ],),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
      child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
