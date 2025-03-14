import 'package:flutter/material.dart';
import '../widgets/credit_card.dart';
import '../widgets/spending_limit_slider.dart';
import '../widgets/transaction_list.dart';
import '../widgets/bottom_nav_bar.dart';
import 'K_add_card.dart';

class MyCardsScreen extends StatelessWidget {
  const MyCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacementNamed(context, '/welcom'),
        ),
        title: Text("My Cards", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {
              Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => AddCardScreen()),
);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Widget carte bancaire
            CreditCardWidget(
              cardNumber: "4562 1122 4595 7852",
              cardHolder: "AR Jonson",
              expiry: "24/2000",
              cvv: "6986",
              logoAsset: "https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png",
            ),
            SizedBox(height: 20),
            Text("Transactions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(child: TransactionList()), // Réutilisation du widget
            SizedBox(height: 20),
            Text("Monthly spending limit", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            SpendingLimitSlider(), // Widget pour la limite de dépenses
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1), // Sélectionne l'onglet "My Cards"
    );
  }
}
