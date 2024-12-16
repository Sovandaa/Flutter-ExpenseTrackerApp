import 'package:expense_app/models/expense.dart';
import 'package:flutter/foundation.dart';

class ExpenseManager {
  final List<Expense> expenses;

  ExpenseManager({required this.expenses});

  //calculate total expenses
  double calculateTotal(List<Expense> expenses) {
    double total = 0;

    for (var expense in expenses) {
      total += expense.amount;
    }
    
    return total;
  }

  // add expense
  void addExpense(Expense newExpense) {
    expenses.add(newExpense);
  }

  // get all expense
  List<Expense> getAllExpense() {
    return expenses;
  }

  // update each expense
  void updateExpense(String id, Expense updatedExpense) {}

  // remove expense
  void removeExpense(String id) {}

  // filter expense by category
  List<Expense> filterbyCategory(Category category) {
    return expenses;
  }

  // list all expenses
  void viewAllExpense() {}
}
