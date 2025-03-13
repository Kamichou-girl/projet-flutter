import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 28, 56, 80),
      unselectedItemColor: Colors.grey,
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
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card_outlined), label: "My Cards"),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Statistics"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}
