import 'package:expense_app/models/category.dart';
import 'package:expense_app/models/expense.dart';

// late Category expenseCategory;

final List<Expense> expensesData = [
  Expense(
    id: '001',
    title: "Going out", 
    amount: 12, 
    date: DateTime.now(), 
    category: Category.entertainment
  ),
  Expense(
    id: '002',
    title: "Fuel", 
    amount: 5, 
    date: DateTime.now(), 
    category: Category.transportation
  ),
  Expense(
    id: '003',
    title: "Lunch", 
    amount: 12, 
    date: DateTime.now(), 
    category: Category.food
  ),
    Expense(
      id: '004',
    title: "Something", 
    amount: 12, 
    date: DateTime.now(), 
    category: Category.others
  ),
  
  
];
