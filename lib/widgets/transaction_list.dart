import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionList extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {"name": "Apple Store", "category": "Entertainment", "amount": "-\$5.99", "icon": FontAwesomeIcons.apple},
    {"name": "Spotify", "category": "Music", "amount": "-\$12.99", "icon": FontAwesomeIcons.spotify},
    {"name": "Money Transfer", "category": "Transaction", "amount": "\$300", "icon": FontAwesomeIcons.exchangeAlt},
    {"name": "Grocery", "category": "Shopping", "amount": "-\$88", "icon": FontAwesomeIcons.shoppingCart},
  ];

   TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        var transaction = transactions[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(transaction["icon"], color: Colors.black),
          ),
          title: Text(transaction["name"], style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(transaction["category"], style: TextStyle(color: Colors.grey)),
          trailing: Text(transaction["amount"], style: TextStyle(color: transaction["amount"].startsWith('-') ? Colors.red : Colors.blue, fontWeight: FontWeight.bold)),
        );
      },
    );
  }
}