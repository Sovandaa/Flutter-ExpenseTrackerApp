import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpenseBarGraph extends StatelessWidget {
  const ExpenseBarGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 6,
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true, 
                reservedSize: 28,
                
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 24,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return Text('Mon');
                    case 1:
                      return Text('Tue');
                    case 2:
                      return Text('Wed');
                    case 3:
                      return Text('Thu');
                    case 4:
                      return Text('Fri');
                    case 5:
                      return Text('Sat');
                    case 6:
                      return Text('Sun');
                    default:
                      return Text('');
                  }
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(
            show: false,
          ), 
          barGroups: [
            BarChartGroupData(x: 0, barRods: [
              BarChartRodData(toY: 2, color: Colors.blue),
            ]),
            BarChartGroupData(x: 1, barRods: [
              BarChartRodData(toY: 3, color: Colors.blue),
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(toY: 5, color: Colors.blue),
            ]),
            BarChartGroupData(x: 3, barRods: [
              BarChartRodData(toY: 2, color: Colors.blue),
            ]),
            BarChartGroupData(x: 4, barRods: [
              BarChartRodData(toY: 1, color: Colors.blue),
            ]),
            BarChartGroupData(x: 5, barRods: [
              BarChartRodData(toY: 2, color: Colors.blue),
            ]),
            BarChartGroupData(x: 6, barRods: [
              BarChartRodData(toY: 4, color: Colors.blue),
            ]),
          ],
        ),
      ),
    );
  }
}
