import 'package:expenses/components/transactional_user.dart';
import 'package:flutter/material.dart';
main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage()
      );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
      title: Text("Despesas Pessoais"),
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
            TransactionalUser()
          ],),
      ),
    );
  }
}
