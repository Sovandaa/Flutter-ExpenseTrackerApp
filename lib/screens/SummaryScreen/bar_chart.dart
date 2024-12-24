import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpenseBarChart extends StatelessWidget {
  const ExpenseBarChart({super.key, required this.dailyExpenses});
  final List<double> dailyExpenses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: dailyExpenses.isEmpty
              ? 6
              : dailyExpenses.reduce((a, b) => a > b ? a : b) + 2,
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                getTitlesWidget: (value, meta) {
                  return Text(
                    '\$${value.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text('Mon');
                    case 1:
                      return const Text('Tue');
                    case 2:
                      return const Text('Wed');
                    case 3:
                      return const Text('Thu');
                    case 4:
                      return const Text('Fri');
                    case 5:
                      return const Text('Sat');
                    case 6:
                      return const Text('Sun');
                    default:
                      return const Text('');
                  }
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          barGroups: List.generate(7, (index) {
            double expense =
                dailyExpenses.length > index ? dailyExpenses[index] : 0.0;
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: expense,
                  color: Colors.blue,
                  width: 18,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            );
          }).toList(),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              tooltipPadding: const EdgeInsets.all(6),
              
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  '\$${rod.toY.toStringAsFixed(0)}',
                  const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
