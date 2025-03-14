import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'K_transac_hist.dart';

class TransactionPage extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {"icon": Icons.apple, "title": "Apple Store", "category": "buy", "amount": 5.99},
    {"icon": Icons.music_note, "title": "Spotify", "category": "Music", "amount": 12.99},
    {"icon": Icons.download_outlined, "title": "Money Transfer", "category": "Transaction", "amount": -300},
    {"icon": Icons.shopping_cart, "title": "Grocery", "category": "Shopping", "amount": 88},
    {"icon": Icons.airplane_ticket, "title": "Travel", "category": "Travel", "amount": 250},
    {"icon": Icons.local_movies, "title": "Netflix", "category": "Entertainment", "amount": 15.99},
    {"icon": Icons.directions_car, "title": "Uber Ride", "category": "Transport", "amount": 22.50},
    {"icon": Icons.shopping_bag, "title": "Amazon Purchase", "category": "Shopping", "amount": 120},
    {"icon": Icons.restaurant, "title": "Dinner Out", "category": "Food & Drinks", "amount": 45.00},
    {"icon": Icons.fitness_center, "title": "Gym Membership", "category": "Fitness", "amount": 30.00},
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

  @override
  Widget build(BuildContext context) {
    double totalSpending = transactions.fold(0, (sum, item) => sum + item["amount"].abs());
    double percentage = totalSpending / 1000;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Transactions", style: TextStyle(fontFamily: 'Poppins')),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircularPercentIndicator(
                radius: 80.0,
                lineWidth: 10.0,
                percent: percentage.clamp(0.0, 1.0),
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${(percentage * 100).toStringAsFixed(0)}%", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                    Text("Transaction", style: TextStyle(fontSize: 14, color: Colors.grey, fontFamily: 'Poppins')),
                  ],
                ),
                progressColor: const Color.fromARGB(255, 85, 255, 0),
                backgroundColor: Colors.grey.shade200,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Transaction History", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                ElevatedButton(
                  onPressed: () {
                    // Définis ici la page de destination
                    Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => TransactionHistoryScreen()),
);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Couleur de fond du bouton
                    foregroundColor: Colors.blue, // Couleur du texte du bouton
                    elevation: 0, // Supprime l'ombre du bouton
                  ),
                  child: Text("See All", style: TextStyle(fontFamily: 'Poppins')),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: transactions.map((transaction) {
                  return transactionItem(transaction["title"], transaction["category"], "- \$${transaction["amount"]}", transaction["icon"], getIconColor(transaction["category"]));
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget transactionItem(String title, String subtitle, String amount, IconData icon, Color color) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(icon, color: color),  // L'icône aura la couleur de la catégorie
        backgroundColor: Colors.grey[300],    // Le cercle sera gris
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey, fontFamily: 'Poppins')),
      trailing: Text(amount, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
    );
  }
}
