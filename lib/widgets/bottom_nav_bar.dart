import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
       backgroundColor: Colors.white, // NavBar blanche
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      currentIndex: selectedIndex,
      onTap: (index) {
        if (index == selectedIndex) return; // Évite de recharger la même page
        
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/welcom');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/mycards');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/statistics');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/settings');// Ajoute ici la navigation vers la page "Settings" si elle existe
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
