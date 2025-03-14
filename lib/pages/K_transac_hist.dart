import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionHistoryScreen extends StatefulWidget {
  @override
  TransactionHistoryScreenState createState() =>
      TransactionHistoryScreenState();
}

class TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  int _selectedIndex = 0; 

  final List<Map<String, dynamic>> transactions = [
    {"icon": Icons.apple, "title": "Apple Store", "category": "buy", "amount": "- \$5.99"},
    {"icon": Icons.music_note, "title": "Spotify", "category": "Music", "amount": "- \$12.99"},
    {"icon": Icons.download_outlined, "title": "Money Transfer", "category": "Transaction", "amount": "\$300"},
    {"icon": Icons.shopping_cart, "title": "Grocery", "category": "Shopping", "amount": "- \$88"},
    {"icon": Icons.airplane_ticket, "title": "Travel", "category": "Travel", "amount": "- \$250"},
    {"icon": Icons.local_movies, "title": "Netflix", "category": "Entertainment", "amount": "- \$15.99"},
    {"icon": Icons.directions_car, "title": "Uber Ride", "category": "Transport", "amount": "- \$22.50"},
    {"icon": Icons.shopping_bag, "title": "Amazon Purchase", "category": "Shopping", "amount": "- \$120"},
    {"icon": Icons.restaurant, "title": "Dinner Out", "category": "Food & Drinks", "amount": "- \$45.00"},
    {"icon": Icons.fitness_center, "title": "Gym Membership", "category": "Fitness", "amount": "- \$30.00"},
  ];

  Color getIconColor(String category) {
    switch (category) {
      case "buy":
        return Colors.black;
      case "Music":
        return Colors.green;
      case "Transaction":
        return Colors.black;
      case "Shopping":
        return Colors.blue;
      case "Travel":
        return Colors.blueGrey;
      case "Fitness":
        return Colors.orange;
      case "Entertainment":
        return Colors.red;
      case "Food & Drinks":
        return Colors.purple;
      default:
        return Colors.black;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _navigateToScreen(index);
  }

  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/card_info');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/stat_debts');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Transaction History", style: GoogleFonts.poppins()),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Today",
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                var transaction = transactions[index];
                return ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Icon(transaction["icon"],
                          color: getIconColor(transaction["category"]))),
                  title: Text(
                    transaction["title"],
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    transaction["category"],
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                  trailing: Text(
                    transaction["amount"],
                    style: GoogleFonts.poppins(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // NavBar blanche
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_outlined),
            label: "My Cards",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline),
            label: "Statistics",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
