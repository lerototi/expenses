import 'dart:math';

import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transactional_form.dart';
import 'package:flutter/material.dart';

import 'components/transactional_list.dart';
import 'models/transaction.dart';
main() => runApp(ExpensesApp());

class ExpensesApp extends  StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold)
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold)
          )
        )
      ),
      
      );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   final List<Transaction> _transactions = [
      Transaction(id: 't0', title: 'conta antiga', value: 400.00, date: DateTime.now().subtract(Duration(days:33))),
      Transaction(id: 't1', title: 'Novo tenis de corrida', value: 310.76, date: DateTime.now().subtract(Duration(days:3))),
      Transaction(id: 't2', title: 'Conta de luz', value: 100.30, date: DateTime.now().subtract(Duration(days:4))),
      Transaction(id: 't3', title: 'Cartão de credito', value: 1000.00, date: DateTime.now()),
      Transaction(id: 't4', title: 'Lanche', value: 40.80, date: DateTime.now().subtract(Duration(days:4))),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }


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
    Navigator.of(context).pop();
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
            Chart(recentTransaction: _recentTransactions),
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
