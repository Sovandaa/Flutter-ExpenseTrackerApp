import 'package:expense_app/models/expense.dart';
import 'package:expense_app/widgets/expenses_form.dart';
import 'package:flutter/material.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key, required this.onTappedAdd});
  final Function(Expense) onTappedAdd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Expense"),
      ),
      body: ExpensesForm(onCreated: onTappedAdd),
    );
  }
}


