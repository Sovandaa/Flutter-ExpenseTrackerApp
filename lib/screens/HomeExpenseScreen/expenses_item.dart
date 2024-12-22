import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem({
    super.key,
    required this.expense,
    required this.onRemoved,
    required this.onTapped,
  });

  final Expense expense;
  final Function(Expense) onRemoved;
  final Function(Expense) onTapped;
  final formatter = DateFormat.yMd();

  String get formattedDate => formatter.format(expense.date);

  Future<bool?> showDeleteAlert(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(
          "Delete Expense?",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
        ),
        content: Text('Are you sure you want to delete this expense?'),
        actions: [
          TextButton(
            onPressed: () => {
              Navigator.pop(ctx, false),
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () => {
              Navigator.pop(ctx, true),
              onRemoved(expense),
            },
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),

      // slide dismissible to delete expense
      child: Dismissible(
        key: Key(expense.id),
        confirmDismiss: (direction) => showDeleteAlert(context),
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: BoxDecoration(
            color: Colors.red[400],
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(20),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),

        child: GestureDetector(
          // on tap item to view expense detail
          onTap: () {
            onTapped(expense); 
          },

          // expense card
          child: SizedBox(
            height: 70,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: ListTile(
                leading: Icon(
                  expense.category.icon,
                  color: expense.category.color,
                ),
                title: Text(
                  expense.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$${expense.amount.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      formattedDate,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ),
        
      ),
    );
  }
}
