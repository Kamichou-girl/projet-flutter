import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolder;
  final String expiry;
  final String cvv;
  final String logoAsset;
  final double balance; // Ajout du solde

  const CreditCardWidget({
    super.key,
    required this.cardNumber,
    required this.cardHolder,
    required this.expiry,
    required this.cvv,
    required this.logoAsset,
    required this.balance, // Ajout du paramètre balance
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        color: const Color.fromARGB(221, 20, 1, 90),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Image d'arrière-plan
          Positioned.fill(
            child: Image.asset(
              "assets/image/arrier3.png",
              fit: BoxFit.cover,
            ),
          ),
          // Cercle en bas à droite
          Positioned(
            bottom: -40,
            right: -40,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start, // Alignement à gauche
              children: [
                // Solde de la carte
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Balance",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    Text(
                      "\$${balance.toStringAsFixed(2)}", // Affichage du solde
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // Icônes carte et sans contact
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.credit_card, color: Colors.white.withOpacity(0.9), size: 40),
                    Icon(Icons.contactless, color: Colors.white.withOpacity(0.9), size: 28),
                  ],
                ),
                // Numéro de carte
                Text(
                  cardNumber,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Nom du titulaire
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    cardHolder,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                // Expiry, CVV et logo de la carte
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Expiry Date", style: TextStyle(color: Colors.grey, fontSize: 10)),
                            const SizedBox(height: 2),
                            Text(expiry, style: const TextStyle(color: Colors.white, fontSize: 12)),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("CVV", style: TextStyle(color: Colors.grey, fontSize: 10)),
                            const SizedBox(height: 2),
                            Text(cvv, style: const TextStyle(color: Colors.white, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    Image.network(logoAsset, width: 40, height: 40),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
