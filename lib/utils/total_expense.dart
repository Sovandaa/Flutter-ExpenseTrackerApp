import 'package:flutter/material.dart';

class TotalExpenseBanner extends StatelessWidget {
  final double totalExpense;

  const TotalExpenseBanner({super.key, required this.totalExpense});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 120, 
        decoration: BoxDecoration(
                gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlue, Colors.white70], // Your custom gradient colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                ),
          borderRadius: BorderRadius.circular(20), 
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              // spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_balance_wallet, 
                  color: Colors.white,
                  size: 24,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Total Expense",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8), 
            Text(
              "\$${totalExpense.toStringAsFixed(2)}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
