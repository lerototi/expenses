import 'package:flutter/material.dart';

class TransactionalForm extends StatefulWidget {

  final void Function(String, double) onSubmit;
  TransactionalForm(this.onSubmit);

  @override
  _TransactionalFormState createState() => _TransactionalFormState();
}

class _TransactionalFormState extends State<TransactionalForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    
    if(title.isEmpty || value <= 0) {
      return;
    }
      
      widget.onSubmit(title, value);
              
  }

  @override
  Widget build(BuildContext context) {
    
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
          children: [
            TextField(decoration: InputDecoration(
              labelText: 'Título'),
              controller: titleController,
              onSubmitted: (valor) => _submitForm()),
            TextField(decoration: InputDecoration(
              labelText: 'Valor (R\$)'),
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (valor) => _submitForm()),
            Container(
              width: double.infinity, 
              child: 
              ElevatedButton(
                onPressed: () =>_submitForm(),
                child: Text("Nova transação", style: TextStyle(color: Colors.purple),),
                style: ElevatedButton.styleFrom(primary: Colors.white)
                )), 
            ],
          ),
        ),
      );
  }
}