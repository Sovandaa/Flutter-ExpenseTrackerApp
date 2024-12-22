import 'package:expense_app/models/expense.dart';
import 'package:expense_app/screens/SummaryScreen/expense_bar_graph.dart';
import 'package:expense_app/screens/SummaryScreen/pie_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({
    super.key, required this.expenses,
  });
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF2F2F8),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(3, 3),
                  ),
                ],
              ), // Set the desired height here
              child: ExpenseBarGraph(),
            ),
          ),
          SizedBox(height: 8),

          // Pie Chart Expense
          Padding(
            padding: EdgeInsets.all(20),
            child: ExpensePieChart(expenses: expenses),
          ),
          
        ],
      ),
    );
  }
}


// import 'package:expense_app/models/expense.dart';
// import 'package:expense_app/screens/SummaryScreen/expense_bar_graph.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class SummaryScreen extends StatelessWidget {
//   const SummaryScreen({
//     super.key, required this.expense,
//   });
//   final List<Expense> expense;

//   @override
//   Widget build(BuildContext context) {
//     final expenseList = ExpenseList();
//     expenseList.expenses = expense;
//     final pieChartExpense = expenseList.calculatePieChartData();

//     return Scaffold(
//       backgroundColor: Color(0xFFF2F2F8),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(20),
//             child: Container(
//               height: 200,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     spreadRadius: 1,
//                     blurRadius: 10,
//                     offset: const Offset(3, 3),
//                   ),
//                 ],
//               ), // Set the desired height here
//               child: ExpenseBarGraph(),
//             ),
//           ),
//           SizedBox(height: 8),

//           // Pie Chart Expense
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: PieChart(
//               swapAnimationCurve: Curves.easeInOutQuint,
//               swapAnimationDuration: Duration(milliseconds: 750),
//               PieChartData(
//                 sections: pieChartExpense.map((data) {
//                   return PieChartSectionData(
//                     color: data.category.color,
//                     value: data.totalAmount,
//                     title:
//                         '${data.category.label}\n${data.totalAmount.toStringAsFixed(2)}',
//                   );
//                 }).toList(),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
