import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/K_card_info.dart';
import 'package:flutter_application_1/pages/modele/credit_card.dart';
import '../widgets/credit_card.dart';
import '../widgets/spending_limit_slider.dart';
import '../widgets/transaction_list.dart';
import '../widgets/bottom_nav_bar.dart';
import 'K_add_card.dart';


class MyCardsScreen extends StatefulWidget {
  const MyCardsScreen({super.key});

  @override
  _MyCardsScreenState createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen> {
  final cardRepo = CardRepository();

  // Si aucune carte n'est sélectionnée, on affiche la première carte de la liste
  Map<String, String> get selectedCard =>
      cardRepo.selectedCard ?? cardRepo.cards[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/welcom'),
        ),
        title: Text("My Cards",
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () async {
              // Ouvre AddCardScreen et attend une carte sélectionnée ou ajoutée
              final newCard = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCardScreen()),
              );
              if (newCard != null && newCard is Map<String, String>) {
                // Mise à jour dans le repository et actualisation de l'affichage
                setState(() {
                  cardRepo.selectCard(newCard);
                });
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Affichage de la carte mise à jour depuis le repository
            CreditCardWidget(
              cardNumber: selectedCard['cardNumber']!,
              cardHolder: selectedCard['cardHolder']!,
              expiry: selectedCard['expiry']!,
              cvv: selectedCard['cvv']!,
              logoAsset: selectedCard['logoAsset']!,
            ),
            SizedBox(height: 20),
            Text("Transactions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(child: TransactionList()),
            SizedBox(height: 20),
            Text("Monthly spending limit",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            SpendingLimitSlider(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1),
    );
  }
}
