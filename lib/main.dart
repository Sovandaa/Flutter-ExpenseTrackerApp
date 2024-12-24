
import 'package:expense_app/screens/MainScreen/main_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(ExpenseTrackerApp());

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // color: Color(0xFFF2F2F8),
      debugShowCheckedModeBanner: false,
      // home: ExpenseScreen(),
      home: MainScreen(),
    );
  }
}

