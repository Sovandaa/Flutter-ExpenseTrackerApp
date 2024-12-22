import 'package:expense_app/models/expense.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpensePieChart extends StatelessWidget {
  const ExpensePieChart({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    final expenseList = ExpenseList();
    expenseList.expenses = expenses;
    final pieChartExpense = expenseList.calculatePieChartData();

    return Container(
        height: 200,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(3, 3),
            ),
          ],
        ),

        child: PieChart(
          swapAnimationCurve: Curves.easeInOutQuint,
          // curve: Curves.easeInOutQuint,
          // duration: Duration(milliseconds: 750),
          PieChartData(
            sections: pieChartExpense.map((data) {
              return PieChartSectionData(
                color: data.category.color,
                value: data.totalAmount,
                title:
                    '${data.category.label}\n\$${data.totalAmount.toStringAsFixed(1)}',
              );
            }).toList(),
          ),
        )
      );
  }
}
