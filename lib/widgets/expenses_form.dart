import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesForm extends StatefulWidget {
  const ExpensesForm({super.key, required this.onCreated});
  final Function(Expense) onCreated;

  @override
  State<ExpensesForm> createState() => _ExpensesFormState();
}

class _ExpensesFormState extends State<ExpensesForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("How much?")
        ],
      ),
    );
  }
}
