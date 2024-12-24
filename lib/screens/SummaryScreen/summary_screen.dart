import 'package:expense_app/models/expense.dart';
import 'package:expense_app/screens/SummaryScreen/bar_chart.dart';
import 'package:flutter/material.dart';
import 'pie_chart.dart';
import 'package:intl/intl.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    ExpenseList expenseList = ExpenseList();
    expenseList.expenses = expenses;

    List<double> dailyExpense = expenseList.getDailyExpenses();
    String todayDate = DateFormat('EEEE, MMM d, y').format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    todayDate,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(3, 3),
                        ),
                      ],
                    ),
                    child: ExpenseBarChart(dailyExpenses: dailyExpense),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: ExpensePieChart(expenses: expenses),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
