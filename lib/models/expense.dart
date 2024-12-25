import 'package:expense_app/models/category.dart';
// import 'package:fl_chart/fl_chart.dart';
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
        pieData.add(
            PieChartExpenseData(category: category, totalAmount: totalAmount));
      }
    }

    return pieData;
  }

  PieChartExpenseData? getHighestExpenseCategory() {
    List<PieChartExpenseData> pieData = calculatePieChartData();

    if (pieData.isEmpty) {
      return null;
    }

    PieChartExpenseData? highest =
        pieData[0]; // Assume the first index is the highest

    for (PieChartExpenseData data in pieData) {
      if (data.totalAmount > highest!.totalAmount) {
        highest = data;
      }
    }

    return highest;
  }

  PieChartExpenseData? getLowestExpenseCategory() {
    List<PieChartExpenseData> pieData = calculatePieChartData();
    if (pieData.isEmpty) {
      return null;
    }
    PieChartExpenseData? lowest =
        pieData[0]; // Assume the first index is the lowest
    for (PieChartExpenseData data in pieData) {
      if (data.totalAmount < lowest!.totalAmount) {
        lowest = data;
      }
    }
    return lowest;
  }

  List<double> getDailyExpenses() {
    // list store total expenses each day of week
    List<double> dailyExpenses = List<double>.filled(7, 0.0);

    for (var expense in expenses) {
      int dayOfWeek = expense.date.weekday - 1; // 0-Monday, 6-Sunday
      dailyExpenses[dayOfWeek] += expense.amount;
    }

    return dailyExpenses;
  }

  double getAverageDailyExpense() {
    List<double> dailyExpense = getDailyExpenses();
    if (dailyExpense.isEmpty) {
      return 0;
    } else {
      return dailyExpense.reduce((a, b) => a + b) / dailyExpense.length;
    }
  }

  // List<double> getMonthlyExpenses() {
  //   // list store total expenses each month
  //   List<double> monthlyExpenses = List<double>.filled(12, 0.0);

  //   for (var expense in expenses) {
  //     int month = expense.date.month - 1;
  //     monthlyExpenses[month] += expense.amount;
  //   }

  //   return monthlyExpenses;
  // }
}

class PieChartExpenseData {
  final Category category;
  final double totalAmount;

  PieChartExpenseData({required this.category, required this.totalAmount});
}
