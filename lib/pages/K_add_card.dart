import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/K_card_info.dart';
import 'package:flutter_application_1/pages/modele/credit_card.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCardScreen extends StatefulWidget {
  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final cardRepo = CardRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
              // Si l'utilisateur quitte sans sélectionner, on retourne simplement
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          "All Cards",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Affichage dynamique de la liste des cartes
            Expanded(
              child: ListView.builder(
                itemCount: cardRepo.cards.length,
                itemBuilder: (context, index) {
                  final card = cardRepo.cards[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: InkWell(
                      onTap: () {
                        // Mise à jour du repository et retour de la carte sélectionnée
                        cardRepo.selectCard(card);
                        Navigator.pop(context, card);
                      },
                      child: _buildCreditCard(
                        cardNumber: card['cardNumber']!,
                        cardHolder: card['cardHolder']!,
                        expiry: card['expiry']!,
                        cvv: card['cvv']!,
                        logoAsset: card['logoAsset']!,
                        backgroundImage: card['backgroundImage'],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () async {
                  // Ouvre l'écran de saisie pour ajouter une nouvelle carte
                  final newCard = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CardScreen()),
                  );
                  if (newCard != null && newCard is Map<String, String>) {
                    setState(() {
                      cardRepo.cards.add(newCard);
                    });
                  }
                },
                child: Text(
                  "Add Card +",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreditCard({
    required String cardNumber,
    required String cardHolder,
    required String expiry,
    required String cvv,
    required String logoAsset,
    String? backgroundImage,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xFF14015A),
        borderRadius: BorderRadius.circular(16),
        image: backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.credit_card, color: Colors.white, size: 40),
                Icon(Icons.contactless, color: Colors.white, size: 28),
              ],
            ),
            Text(
              cardNumber,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                cardHolder,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Expiry Date",
                        style: GoogleFonts.poppins(color: Colors.grey, fontSize: 10)),
                    SizedBox(height: 2),
                    Text(expiry, style: GoogleFonts.poppins(color: Colors.white, fontSize: 12)),
                  ],
                ),
                Image.asset(
                  logoAsset,
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
