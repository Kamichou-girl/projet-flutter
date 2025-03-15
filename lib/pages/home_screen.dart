import 'package:flutter/material.dart';
import '../widgets/credit_card.dart';
import '../widgets/action_buttons.dart';
import '../widgets/transaction_list.dart';
import '../widgets/bottom_nav_bar.dart';
import 'K_search_debts.dart';
import 'receive_money.dart'; // Import de ReceiveMoneyScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double balance = 500.00; // Exemple de solde initial

  void updateBalance(double amount, bool isReceiving) {
    setState(() {
      if (isReceiving) {
        balance += amount;
      } else {
        balance -= amount;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back,', style: TextStyle(color: Colors.grey, fontSize: 14)),
            Text('Tanya Myroniuk', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CreditCardWidget(
              cardNumber: "1234 5678 9012 3456",
              cardHolder: "John Doe",
              expiry: "08/2026",
              cvv: "123",
              logoAsset: "https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png",
              balance: balance, // Ajout du solde
            ),
            SizedBox(height: 20),
            ActionButtons(updateBalance: updateBalance),
            SizedBox(height: 20),
            Text("Transaction", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(child: TransactionList()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 0),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReceiveMoneyScreen(updateBalance: updateBalance),
          ),
        ),
        child: Icon(Icons.add), // Bouton pour accéder à ReceiveMoneyScreen
      ),
    );
  }
}
