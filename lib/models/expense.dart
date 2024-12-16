import 'package:expense_app/models/category.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.note,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  final String? note;
}

class ExpenseList {
  List<Expense> expenses = [];

  void addExpense(Expense newExpense) {
    expenses.add(newExpense);
  }

  double calculateTotal() {
    double total = 0;
    for (var expense in expenses) {
      total += expense.amount;
    }
    return total;
  }

  List<Expense> getAllExpense() {
    return expenses;
  }

  void removeExpense(String id) {
    expenses.removeWhere(
      (expense) => expense.id == id);
  }

}
