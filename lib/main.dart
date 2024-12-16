import 'package:expense_app/screens/expense_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(ExpenseTrackerApp());

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // color: Color(0xF7F7F7F7),
      debugShowCheckedModeBanner: false,
      home: ExpenseScreen(),
    );
  }
}
