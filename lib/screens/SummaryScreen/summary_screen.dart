
import 'package:expense_app/screens/SummaryScreen/expense_bar_graph.dart';
import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key,});
  // final ExpenseList expenseList;

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
        ],
      ),
    );
  }
}
