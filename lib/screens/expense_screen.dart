import 'package:expense_app/data/expense_data.dart';
import 'package:expense_app/models/expense.dart';
import 'package:expense_app/screens/add_expense.dart';
import 'package:expense_app/screens/summary_screen.dart';
import 'package:expense_app/widgets/bottom_nav.dart';
import 'package:expense_app/widgets/expenses_list.dart';
import 'package:expense_app/widgets/total_expense.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  int selectedIndex = 0; // home screen

  final ExpenseList expenseList = ExpenseList();

  @override
  void initState() {
    super.initState();
    // add the dummy data from expensesData to the ExpenseList
    for (var expense in expensesData) {
      expenseList.addExpense(expense);
    }
  }

  // Function to add a new expense
  void addNewExpense(Expense newExpense) {
    setState(() {
      expenseList.addExpense(newExpense);
    });

    Navigator.pop(context); // Go back to the previous screen after adding
  }

  // Calculate total expense 
  double get totalExpense => expenseList.calculateTotal();

  Future<void> onItemTapped(int index) async {
    setState(() {
      selectedIndex = index; // update selected index
    });
    if (selectedIndex == 1) {
      // Navigate to screen add expense
      await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddExpenseScreen(onTappedAdd: addNewExpense)),
      );
      setState(() {
        selectedIndex = 0; // Reset to Home tab
      });
    } else if (selectedIndex == 2) {
      // Navigate to screen summary
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SummaryScreen()),
      );
      setState(() {
        selectedIndex = 0; // Reset to Home tab
      });
    }
  }

  // final List<Expense> registeredExpenses = expensesData;
  // double get totalExpense => ExpenseList().calculateTotal(registeredExpenses);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Manager"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
      ),
      backgroundColor: Color(0xF7F7F7F7),
      body: Center(
        child: Column(
          children: [
            //banner display total expense
            TotalExpenseBanner(totalExpense: totalExpense),

            // display list of expenses
            Text("Recent Transactions"),
            Expanded(
              child: ExpensesList(expenses: expenseList.getAllExpense()),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarApp(
        selectedIndex: selectedIndex,
        onTapped: onItemTapped, // trigger when tap item in nav to switch screen
      ),
    );
  }
}
