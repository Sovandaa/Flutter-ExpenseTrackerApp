import 'package:expense_app/models/category.dart';
import 'package:expense_app/models/expense.dart';
import 'package:expense_app/screens/ExpenseFormScreen/expenses_form.dart';
import 'package:expense_app/screens/HomeExpenseScreen/expense_detail.dart';
import 'package:expense_app/screens/HomeExpenseScreen/expenses_list.dart';
import 'package:expense_app/utils/total_expense.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  final List<Expense> expenses;
  const ExpenseScreen({super.key, required this.expenses});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final ExpenseList expenseList = ExpenseList();
  Category? _selectedCategory;

  @override
  void initState() {
    super.initState();
    // Initialize the expense list with the passed expenses
    expenseList.expenses = widget.expenses;
  }

  // Show details of an expense
  void showExpenseDetail(Expense expense) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return ExpenseDetailModal(
          expense: expense,
          onEdit: () => editExpense(expense),
        );
      },
    );
  }

  void editExpense(Expense expense) async {
    Expense? updatedExpense = await Navigator.of(context).push<Expense>(
      MaterialPageRoute(
        builder: (ctx) => ExpensesForm(
          mode: FormMode.editing,
          editedItem: expense,
        ),
      ),
    );

    if (updatedExpense != null) {
      setState(() {
        expenseList.updateExpense(updatedExpense); // Update the expense
      });
      // show msg update success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Expense updated successfully!"),
          backgroundColor: Colors.blue,
          duration: Duration(milliseconds: 850),
        ),
      );
    }
    Navigator.of(context).pop(updatedExpense);
  }

  // Calculate total expense
  double get totalExpense => expenseList.calculateTotal();

  // Remove expense from list
  void onRemoved(Expense expense) {
    setState(() {
      expenseList.removeExpense(expense.id);
    });
  }

  // filtered expenses by category
  List<Expense> get filteredExpenses {
    if (_selectedCategory == null) {
      return expenseList.getAllExpense();
    } else {
      return expenseList.getExpensesByCategory(_selectedCategory!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F8),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner display total expense
          TotalExpenseBanner(totalExpense: totalExpense),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Display list of expenses
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                child: const Text(
                  "Recent Transactions",
                ),
              ),

              // Category filter dropdown with modern design
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                child: Row(
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton<Category?>(
                        hint: const Text("Select Category"),
                        value: _selectedCategory,
                        onChanged: (Category? newCategory) {
                          setState(() {
                            _selectedCategory = newCategory;
                          });
                        },
                        items: [
                          DropdownMenuItem<Category?>(
                            value: null,
                            child: Row(
                              children: const [
                                // Icon(Icons.all_inclusive_rounded),
                                SizedBox(width: 10),
                                Text("All Categories"),
                              ],
                            ),
                          ),
                          ...Category.values.map((Category category) {
                            return DropdownMenuItem<Category?>(
                              value: category,
                              child: Row(
                                children: [
                                  Icon(
                                    category.icon,
                                    color: category.color,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(category.label),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Expanded(
            child: ExpensesList(
              expenses: filteredExpenses,
              onExpenseRemoved: onRemoved,
              onExpenseTapped: showExpenseDetail,
            ),
          ),
        ],
      ),
    );
  }
}
