import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolder;
  final String expiry;
  final String cvv;
  final String logoAsset;

  const CreditCardWidget({
    super.key,
    required this.cardNumber,
    required this.cardHolder,
    required this.expiry,
    required this.cvv,
    required this.logoAsset,
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
          Positioned.fill(
            child: Image.asset(
              "assets/image/arrier3.png",
              fit: BoxFit.cover,
              
            ),
          ),
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.credit_card, color: Colors.white.withOpacity(0.9), size: 40),
                    Icon(Icons.contactless, color: Colors.white.withOpacity(0.9), size: 28),
                  ],
                ),
                Text(
                  cardNumber,
                  style: const TextStyle(
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
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
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
