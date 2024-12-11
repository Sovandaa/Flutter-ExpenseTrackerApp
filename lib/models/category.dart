import 'package:flutter/material.dart';

enum Category {
  food('Food', Icons.fastfood, Colors.green),
  utilities('Utilities', Icons.lightbulb_outline, Colors.blue),
  transportation('Transportation', Icons.directions_car, Colors.orange),
  entertainment('Entertainment', Icons.movie, Colors.purple),
  medical('Medical', Icons.local_hospital, Colors.red),
  education('Education', Icons.school, Colors.teal),
  others('Others', Icons.more_horiz, Colors.grey);

  final String label;
  final IconData icon;
  final Color color;

  const Category(this.label, this.icon, this.color);
}



// import 'package:flutter/material.dart';

// // enum Category {
// //   food('Food', Icons.fastfood, Colors.green),
// //   utilities('Utilities', Icons.lightbulb_outline, Colors.blue),
// //   transportation('Transportation', Icons.directions_car, Colors.orange),
// //   entertainment('Entertainment', Icons.movie, Colors.purple),
// //   medical('Medical', Icons.local_hospital, Colors.red),
// //   education('Education', Icons.school, Colors.teal),
// //   others('Others', Icons.more_horiz, Colors.grey),
// enum Category {
//   food('Food', Icons.fastfood, Colors.green),
//   utilities('Utilities', Icons.lightbulb_outline, Colors.blue),
//   transportation('Transportation', Icons.directions_car, Colors.orange),
//   entertainment('Entertainment', Icons.movie, Colors.purple),
//   medical('Medical', Icons.local_hospital, Colors.red),
//   education('Education', Icons.school, Colors.teal),
//   others('Others', Icons.more_horiz, Colors.grey);

//   final String label;
//   final IconData icon;
//   final Color color;

//   const Category(this.label, this.icon, this.color);
// }
