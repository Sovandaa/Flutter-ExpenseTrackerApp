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




// // Update an expense by its ID
//   void updateExpense(String id, Expense updatedExpense) {
//     int index = expenses.indexWhere((expense) => expense.id == id);
//     if (index != -1) {
//       expenses[index] = updatedExpense; // Replace the old expense with the updated one
//     }
//   }

//   // Get expenses filtered by category
//   List<Expense> getExpensesByCategory(Category category) {
//     return expenses.where((expense) => expense.category == category).toList();
//   }

//   // Get expenses within a specific date range (e.g., fromDate to toDate)
//   List<Expense> getExpensesByDateRange(DateTime fromDate, DateTime toDate) {
//     return expenses
//         .where((expense) => expense.date.isAfter(fromDate) && expense.date.isBefore(toDate))
//         .toList();
//   }

//   // Optional: Method to initialize the ExpenseList with some initial data (e.g., dummy data)
//   void initializeExpenses(List<Expense> initialExpenses) {
//     expenses = initialExpenses;
//   }