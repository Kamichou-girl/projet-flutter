import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/add_personbk.dart';
// si nécessaire pour RequestMoneyScreen

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  String _selectedCurrency = "USD"; // Devise sélectionnée par défaut

  final TextEditingController _amountController =
      TextEditingController(text: "36.00");
        void _showCurrencyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text(
            "Choose Currency",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildCurrencyOption("USD", "Dollar"),
              _buildCurrencyOption("EUR", "Euro"),
              _buildCurrencyOption("FCFA", "Franc CFA"),
            ],
          ),
        );
      },
    );

  }
    // Widget pour chaque option de devise
  Widget _buildCurrencyOption(String currency, String currencyName) {
    return ListTile(
      title: Text(currencyName),
      trailing: _selectedCurrency == currency
          ? const Icon(Icons.check, color: Colors.blue)
          : null,
      onTap: () {
        setState(() {
          _selectedCurrency = currency; // Mise à jour de la devise sélectionnée
        });
        Navigator.pop(context); // Fermer la boîte de dialogue
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barre d’application
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "Send Money",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          // --- 1) Formes ovales en arrière-plan (facultatif) ---
          Positioned(
            top: -80,
            left: -80,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent.withOpacity(0.2),
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent.withOpacity(0.2),
              ),
            ),
          ),
          // --- 2) Contenu principal défilable ---
          SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              children: [
                // --- A) Zone cartes de crédit SANS le container blanc ---
                SizedBox(
                  height: 220,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      _buildCreditCard(
                        cardNumber: "4562 1122 4595 7852",
                        cardHolder: "AR Jonson",
                        expiry: "24/2000",
                        cvv: "6986",
                        logoAsset:
                            "https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png",
                      ),
                      _buildCreditCard(
                        cardNumber: "1234 5678 9012 3456",
                        cardHolder: "John Doe",
                        expiry: "08/2026",
                        cvv: "123",
                        logoAsset:
                            "https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // --- B) Section "Send to" ---
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Send to",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildRecipientCircle(
                              label: "Add",
                              icon: Icons.add,
                              isAddButton: true,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddPersonbk()),
                                );
                              },
                            ),
                            _buildRecipientCircle(label: "Yamilet"),
                            _buildRecipientCircle(label: "Alexa"),
                            _buildRecipientCircle(label: "Yakub"),
                            _buildRecipientCircle(label: "Krishna"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // --- C) Section "Enter Your Amount" ---
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Enter Your Amount',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Change Currency?",
                              style: TextStyle(color: Colors.red, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('USD',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _amountController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                hintText: "0.00",
                                hintStyle: const TextStyle(color: Colors.grey),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 14),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // --- D) Section "Send Money" ---
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Send Money",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget pour construire une "carte de crédit"
  Widget _buildCreditCard({
    required String cardNumber,
    required String cardHolder,
    required String expiry,
    required String cvv,
    required String logoAsset,
  }) {
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
          // Image de fond
          Positioned.fill(
            child: Image.network(
              "https://s3-alpha-sig.figma.com/img/205d/bb52/6f2f76a0b0434f65dd61a8c05221763e?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=iUalk2BHpoe48HU~coNvZgD48RMkCJCbJ0ecVD4VN6HxvwHxyRvwWAMdHQJKCfFi-ERZtrmWYobxISGSuQVC~L0ysPL-~ysqDb7HEuTRCQICCZYpxCX3USy6LJ6UADFtcl1s8bl-yeQiR5RM9FUre2-aOmf-QOnL4gQCLzZXgU~CT2F7hQcvyb2sI7WXUAgY0eAFvfpZUBPWdvaZRxMC1mwQEwZ3NAXLK5XE1pJyCdhADBPHGV9boM2dOYwV9jJDq-KqBn0uAtOI6OE07h-VAVcJ7fNuGj4x-EIhR9BO2sudtl0C34VvIHcDhph~ICTF4mxW5FoLJJ7QxWNMWgHoSQ__",
              fit: BoxFit.cover,
            ),
          ),
          // Cercle partiel en bas à droite
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
          // Contenu principal
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Ligne du haut : puce et paiement sans contact
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.credit_card,
                      color: Colors.white.withOpacity(0.9),
                      size: 40,
                    ),
                    Icon(
                      Icons.contactless,
                      color: Colors.white.withOpacity(0.9),
                      size: 28,
                    ),
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
                // Titulaire
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
                // Expiry, CVV et logo Mastercard
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Bloc Expiry
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Expiry Date",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              expiry,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        // Bloc CVV
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "CVV",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              cvv,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Logo Mastercard
                    Image.network(
                      logoAsset,
                      width: 40,
                      height: 40,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipientCircle({
    required String label,
    IconData? icon,
    bool isAddButton = false,
    VoidCallback? onPressed, // Callback pour gérer l'événement du clic
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: onPressed, // Exécuter la fonction lorsqu'on clique
            child: CircleAvatar(
              radius: 25,
              backgroundColor:
                  isAddButton ? Colors.blueAccent : Colors.grey.shade200,
              child: isAddButton
                  ? Icon(icon, color: Colors.white)
                  : Text(
                      label.isNotEmpty ? label[0].toUpperCase() : "",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
