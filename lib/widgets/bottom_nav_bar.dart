import 'package:flutter/material.dart';
import '../pages/setting_screen.dart';
import '../pages/statistics_screen.dart';
import '../pages/my_cards_screen.dart';
import '../pages/home_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
       backgroundColor: Colors.white, 
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      currentIndex: selectedIndex,
      onTap: (index) {
        if (index == selectedIndex) return;
        
        switch (index) {
          case 0:
            Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => HomeScreen()));
            break;
          case 1:
            Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => MyCardsScreen()));
            break;
          case 2:
            Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => StatisticsScreen()));
            break;
          case 3:
            Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => SettingsScreen()));
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card_outlined), label: "My Cards"),
        BottomNavigationBarItem(icon: Icon(Icons.pie_chart_outline), label: "Statistics"),
        BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Settings"),
      ],
    );
  }
}
