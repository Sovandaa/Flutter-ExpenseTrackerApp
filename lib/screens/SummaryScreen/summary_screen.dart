import 'package:expense_app/models/expense.dart';
import 'package:expense_app/screens/SummaryScreen/bar_chart.dart';
import 'package:expense_app/screens/SummaryScreen/pie_chart.dart';
import 'package:flutter/material.dart';
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
    final highestExpenseCategory = expenseList.getHighestExpenseCategory();
    final lowestExpenseCategory = expenseList.getLowestExpenseCategory();
    final averageDailyExpense = expenseList.getAverageDailyExpense();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Today's Date
            _buildDateCard(todayDate),
            const SizedBox(height: 20),

            // Expense Metrics
            _buildSectionTitle("Expense Metrics"),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    icon: Icons.trending_up,
                    iconColor: Colors.teal[800]!,
                    label: "Highest",
                    value:
                        '${highestExpenseCategory!.category.label}\n\$${highestExpenseCategory.totalAmount.toStringAsFixed(2)}',
                    gradientColors: [
                      Colors.teal.withOpacity(0.7),
                      Colors.tealAccent.withOpacity(0.7)
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildMetricCard(
                    icon: Icons.trending_down,
                    iconColor: Colors.orange[800]!,
                    label: "Lowest",
                    value:
                        '${lowestExpenseCategory!.category.label}\n\$${lowestExpenseCategory.totalAmount.toStringAsFixed(2)}',
                    gradientColors: [
                      Colors.orange.withOpacity(0.7),
                      Colors.deepOrangeAccent.withOpacity(0.7)
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildMetricCard(
                    icon: Icons.calculate,
                    iconColor: Colors.blue[800]!,
                    label: "Average",
                    value:
                        "Daily Expense\n\$${averageDailyExpense.toStringAsFixed(2)}",
                    gradientColors: [
                      Colors.blue.withOpacity(0.7),
                      Colors.lightBlueAccent.withOpacity(0.7)
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Bar Chart for Daily Expenses
            _buildSectionTitle("Daily Expense Breakdown"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: SizedBox(
                height: 300,
                child: ExpenseBarChart(dailyExpenses: dailyExpense),
              ),
            ),
            const SizedBox(height: 20),

            // Pie Chart for Expense by Category
            _buildSectionTitle("Expense by Category"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: SizedBox(
                height: 300,
                child: ExpensePieChart(expenses: expenses),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // show today date card
  Widget _buildDateCard(String date) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today, color: Colors.blueAccent, size: 24),
            const SizedBox(width: 10),
            Text(
              date,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 24,
          color: Colors.blueAccent,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required List<Color> gradientColors,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: iconColor),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
