import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/K_add_card.dart';
import 'package:flutter_application_1/pages/modele/credit_card.dart';
import '../widgets/credit_card.dart';
import '../widgets/action_buttons.dart';
import '../widgets/transaction_list.dart';
import '../widgets/bottom_nav_bar.dart';
import 'K_search_debts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cardRepo = CardRepository();

  // Carte par défaut si aucune n'a encore été sélectionnée
  Map<String, String> defaultCard = {
    'cardNumber': "1234 5678 9012 3456",
    'cardHolder': "John Doe",
    'expiry': "08/2026",
    'cvv': "123",
    'logoAsset': "https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png",
  };

  Map<String, String> get selectedCard =>
      cardRepo.selectedCard ?? defaultCard;

  Future<void> _selectCard() async {
    final card = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCardScreen()),
    );
    // Si une carte a été sélectionnée et renvoyée, met à jour le repository
    if (card != null && card is Map<String, String>) {
      setState(() {
        cardRepo.selectCard(card);
      });
    }
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
            Text('Tanya Myroniuk',
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
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
            // La carte affichée est cliquable pour changer la sélection
            GestureDetector(
              onTap: _selectCard,
              child: CreditCardWidget(
                cardNumber: selectedCard['cardNumber']!,
                cardHolder: selectedCard['cardHolder']!,
                expiry: selectedCard['expiry']!,
                cvv: selectedCard['cvv']!,
                logoAsset: selectedCard['logoAsset']!,
              ),
            ),
            SizedBox(height: 20),
            ActionButtons(),
            SizedBox(height: 20),
            Text("Transaction", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(child: TransactionList()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 0),
    );
  }
}
