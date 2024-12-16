import 'package:expense_app/models/expense.dart';
import 'package:expense_app/widgets/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return expenses.isEmpty
      ? Center(
          child: Text(
            'No expenses found!',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        )
      : ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),
        );
  }
}
