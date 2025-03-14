import 'package:flutter/material.dart';
import '../widgets/credit_card.dart';
import '../widgets/action_buttons.dart';
import '../widgets/transaction_list.dart';
import '../widgets/bottom_nav_bar.dart';
import 'K_search_debts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            ),
            SizedBox(height: 20),
            ActionButtons(),
            SizedBox(height: 20),
            Text("Transaction", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(child: TransactionList()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 0,),
    );
  }
}
