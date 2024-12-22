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
  List<Expense> expenses = List.from(expensesData); // Copy the initial data

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      ExpenseScreen(expenses: expenses), // Pass the current list of expenses
      SummaryScreen(),
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
        
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_titleBars[_currentIndex]),
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

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _addExpense,
      backgroundColor: Colors.lightBlueAccent,
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: const Icon(
        Icons.add_rounded,
        size: 28.0,
        color: Colors.white,
      ),
    );
  }
}
