import 'package:expense_app/models/category.dart';
// import 'package:uuid/uuid.dart';
// const uuid = Uuid();

class Expense {
  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.note,
  });

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  final String? note;
}

class ExpenseList {
  List<Expense> expenses = [];

  double calculateTotal() {
    double total = 0;
    for (var expense in expenses) {
      total += expense.amount;
    }
    return total;
  }

  void addExpense(Expense newExpense) {
    expenses.add(newExpense);
  }

  List<Expense> getAllExpense() {
    return expenses;
  }

  void removeExpense(String id) {
    expenses.removeWhere((expense) => expense.id == id);
  }

  void updateExpense(Expense updatedExpense) {
    int index = expenses.indexWhere((expense) => expense.id == updatedExpense.id);
    if (index != -1) {
      expenses[index] = updatedExpense;
    }
  }

  List<Expense> getExpensesByCategory(Category category) {
    return expenses.where((expense) => expense.category == category).toList();
  }

  List<double> getWeeklyExpenses() {
    List<double> weeklyExpenses = List<double>.filled(7, 0.0);

    for (var expense in expenses) {
      int dayOfWeek = expense.date.weekday -
          1; // DateTime.weekday returns 1 for Monday, 7 for Sunday
      weeklyExpenses[dayOfWeek] += expense.amount;
    }

    return weeklyExpenses;
  }

  void clear() {
    expenses.clear();
  }
}
