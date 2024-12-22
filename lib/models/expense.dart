import 'package:expense_app/models/category.dart';
import 'package:fl_chart/fl_chart.dart';
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

  void clear() {
    expenses.clear();
  }

  void updateExpense(Expense updatedExpense) {
    int index =
        expenses.indexWhere((expense) => expense.id == updatedExpense.id);
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

  List<PieChartExpenseData> calculatePieChartData() {
    List<PieChartExpenseData> pieData = [];

    // loop in all categories to get total amount of each
    for (Category category in Category.values) {
      double totalAmount = 0;
      for (Expense expense in expenses) {
        if (expense.category == category) {
          totalAmount += expense.amount;
        }
      }

      if (totalAmount > 0) {
        pieData.add(PieChartExpenseData(category: category, totalAmount: totalAmount));
      }
    }

    return pieData;
  }
}

class PieChartExpenseData {
  final Category category;
  final double totalAmount;

  PieChartExpenseData({required this.category, required this.totalAmount});
}
