import 'package:flutter/material.dart';
import '../widgets/credit_card.dart'; // Widget pour la carte bancaire
import '../widgets/bottom_nav_bar.dart';

class ReceiveMoneyScreen extends StatefulWidget {
  final Function(double, bool) updateBalance; // Fonction pour mettre à jour le solde

  const ReceiveMoneyScreen({Key? key, required this.updateBalance}) : super(key: key);

  @override
  _ReceiveMoneyScreenState createState() => _ReceiveMoneyScreenState();
}

class _ReceiveMoneyScreenState extends State<ReceiveMoneyScreen> {
  String? selectedPerson;
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Receive Money",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carte bancaire
              CreditCardWidget(
                cardNumber: "4562 1122 4595 7852",
                cardHolder: "AR Jonson",
                expiry: "24/2000",
                cvv: "6986",
                logoAsset: "https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png",
                balance: 0, // Pas besoin d'afficher un vrai solde ici
              ),
              SizedBox(height: 20),

              // Sélection du contact
              Text("Receive from", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildContactButton("Alice"),
                  _buildContactButton("John"),
                  _buildContactButton("Emma"),
                  _buildContactButton("Mike"),
                ],
              ),
              SizedBox(height: 20),

              // Champ pour entrer le montant
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enter Your Amount", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text("USD", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: amountController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "0.00",
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Bouton Recevoir de l'argent
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _showConfirmationDialog,
                  child: Text(
                    "Receive Money",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1),
    );
  }

  // Bouton pour sélectionner un contact avec icône
  Widget _buildContactButton(String name) {
    bool isSelected = selectedPerson == name;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedPerson = name;
            });
          },
          child: CircleAvatar(
            radius: 28,
            backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
            child: Icon(Icons.person_outline, size: 30, color: isSelected ? Colors.white : Colors.black),
          ),
        ),
        SizedBox(height: 5),
        Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Popup de confirmation
  void _showConfirmationDialog() {
    if (selectedPerson == null || amountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select a person and enter an amount")),
      );
      return;
    }

    double amount = double.tryParse(amountController.text) ?? 0.0;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Confirm Transaction"),
          content: Text("Receive \$${amount.toStringAsFixed(2)} from $selectedPerson?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel", style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              onPressed: () {
                widget.updateBalance(amount, true); // Met à jour le solde
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Transaction successful!")),
                );
              },
              child: Text("Confirm", style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}
