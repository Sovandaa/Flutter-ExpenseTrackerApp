import 'package:expense_app/models/expense.dart';
import 'package:expense_app/screens/HomeExpenseScreen/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, 
      required this.expenses, 
      required this.onExpenseRemoved, 
      required this.onExpenseTapped
  });

  final List<Expense> expenses;
  final Function(Expense) onExpenseRemoved;
  final Function(Expense) onExpenseTapped;

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
            itemBuilder: (ctx, index) {
              return ExpenseItem(
                expense: expenses[index], 
                onRemoved: onExpenseRemoved,
                onTapped: onExpenseTapped,
              );
            },
          );
  }
}
