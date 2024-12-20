import 'package:expense_app/screens/home/expense_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(ExpenseTrackerApp());

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // color: Color(0xFFF2F2F8),
      debugShowCheckedModeBanner: false,
      home: ExpenseScreen(),
    );
  }
}
