import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseDetailModal extends StatelessWidget {
  const ExpenseDetailModal({
    super.key, 
    required this.expense,
    required this.onEdit
  });
  
  final Expense expense;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),
          buildDetailRow(
            "Title:", 
            expense.title
          ),
          const SizedBox(height: 8),
          buildDetailRow(
            "Amount:", "\$${expense.amount.toStringAsFixed(2)}",
            color: Colors.red
          ),
          const SizedBox(height: 8),
          buildDetailRow(
            "Category:", 
            expense.category.label,
            icon: expense.category.icon, 
            color: expense.category.color
          ),
          const SizedBox(height: 16),
          buildDetailRow(
            "Note:", 
            expense.note ?? ' '
          ),
          const SizedBox(height: 24),
            Center(
            child: ElevatedButton.icon(
              onPressed: () => onEdit(),
              icon: const Icon(Icons.edit_rounded, color: Colors.white), 
              label: const Text("Edit Expense", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Set the button color to blue
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            ),
        ],
      ),
    );
  }

  Widget buildDetailRow(String label, String value, {Color? color, IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue[100]!),
          ),
          child: Row(
            children: [
              if (icon != null) Icon(icon, size: 16, color: color),
              if (icon != null) const SizedBox(width: 8),
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: color ?? Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


