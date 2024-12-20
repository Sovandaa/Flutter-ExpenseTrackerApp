import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesForm extends StatefulWidget {
  const ExpensesForm({super.key, required this.onCreated});
  final Function(Expense) onCreated;

  @override
  State<ExpensesForm> createState() => _ExpensesFormState();
}

class _ExpensesFormState extends State<ExpensesForm> {
  // create a key to access & control state of the form
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "How much?", 
                  style: TextStyle(fontSize: 24)
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 20,
                  decoration: const InputDecoration(
                    prefix: Text("\$"),
                    hintText: '0',
                  ),
                )
              ],
            )
          ),
          // Padding(
          //   padding: EdgeInsets.all(20),
            
          // )
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      
                    ),
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
