import 'package:expense_app/models/category.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.note,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  final String? note;

}
