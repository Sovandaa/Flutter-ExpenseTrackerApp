import 'package:expense_app/data/expense_data.dart';
import 'package:expense_app/models/expense.dart';
import 'package:expense_app/screens/ExpenseForm/expenses_form.dart';
import 'package:expense_app/screens/HomeExpenseScreen/expense_screen.dart';
import 'package:expense_app/screens/SummaryScreen/summary_screen.dart';
import 'package:expense_app/utils/bottom_nav.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List<Expense> expenses = List.from(expensesData); // pass the initial data

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      ExpenseScreen(expenses: expenses), // Pass the current list of expenses
      // SummaryScreen(),
      SummaryScreen(expenses: expenses),
    ];
  }

  final List<String> _titleBars = [
    "Expense Manager",
    "Summary",
  ];

  void onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> _addExpense() async {
    final newExpense = await Navigator.push<Expense>(
      context,
      MaterialPageRoute(
        builder: (context) => ExpensesForm(mode: FormMode.creating),
      ),
    );
    if (newExpense != null) {
      setState(() {
        expenses.add(newExpense); // Add the new expense to the list
        _screens[0] = ExpenseScreen(
            expenses: expenses); // Update the ExpenseScreen with the new list
      });
      _currentIndex = 0; // Navigate back to the home expense screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _titleBars[_currentIndex],
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      backgroundColor: const Color(0xFFF2F2F8),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBarApp(
        currentIndex: _currentIndex,
        onTapped: onItemTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  // Widget _buildFloatingActionButton() {
  //   return FloatingActionButton(
  //     onPressed: _addExpense,
  //     backgroundColor: Colors.lightBlueAccent,
  //     elevation: 8.0,
  //     shape: CircleBorder(),
  //     child: const Icon(
  //       Icons.add_rounded,
  //       size: 28.0,
  //       color: Colors.white,
  //     ),
  //   );
  // }

  Widget _buildFloatingActionButton() {
    return Container(
      height: 56.0,
      width: 56.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.lightBlueAccent,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: _addExpense,
        backgroundColor: Colors.lightBlueAccent,
        elevation: 2,
        shape: CircleBorder(),
        child: const Icon(
          Icons.add_rounded,
          size: 24.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
