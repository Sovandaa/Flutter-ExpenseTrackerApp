import 'package:expense_app/models/category.dart';
import 'package:expense_app/models/expense.dart';

// late Category expenseCategory;

final List<Expense> expensesData = [
  Expense(
    id: 'E001',
    title: "Book", 
    amount: 12, 
    date: DateTime.now(), 
    category: Category.education
  ),
  Expense(
    id: 'E002',
    title: "Fuel", 
    amount: 5, 
    date: DateTime.now(), 
    category: Category.transportation
  ),
  Expense(
    id: 'E003',
    title: "Lunch", 
    amount: 12, 
    date: DateTime.now(), 
    category: Category.food
  ),
    Expense(
      id: 'E004',
    title: "Something", 
    amount: 12, 
    date: DateTime.now(), 
    category: Category.others
  ),
  Expense(
      id: 'E005',
    title: "Movie", 
    amount: 3, 
    date: DateTime.now(), 
    category: Category.entertainment
  ),
  
  
];
