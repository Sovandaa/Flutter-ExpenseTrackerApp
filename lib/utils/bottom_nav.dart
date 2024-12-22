import 'package:flutter/material.dart';

class BottomNavBarApp extends StatefulWidget {
  const BottomNavBarApp({super.key, required this.currentIndex, required this.onTapped});

  final int currentIndex;
  final void Function(int index) onTapped;

  @override
  State<BottomNavBarApp> createState() => _BottomNavBarAppState();
}

class _BottomNavBarAppState extends State<BottomNavBarApp> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex, 
      onTap: widget.onTapped, 
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      iconSize: 24,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Expense',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.space_dashboard_rounded),
          label: 'Summary',
        ),
      ],
    );
  }
}
