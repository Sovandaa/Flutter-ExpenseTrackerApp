import 'package:flutter/material.dart';

enum Category {
  food('Food', Icons.fastfood_rounded, Colors.green),
  utilities('Utilities', Icons.lightbulb_outline_rounded, Colors.blue),
  transportation('Transportation', Icons.directions_car_rounded, Colors.orange),
  entertainment('Entertainment', Icons.movie_rounded, Colors.purple),
  medical('Medical', Icons.local_hospital_rounded, Colors.red),
  education('Education', Icons.school_rounded, Colors.teal),
  others('Others', Icons.category_rounded, Colors.indigo);

  final String label;
  final IconData icon;
  final Color color;

  const Category(this.label, this.icon, this.color);
}
