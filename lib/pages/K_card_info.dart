import 'package:flutter/material.dart';
import 'K_add_card.dart';

class CardScreen extends StatefulWidget {
  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  // Contrôleurs de texte avec valeurs par défaut
  TextEditingController cardNumberController = TextEditingController(text: "1234 5678 9012 3456");
  TextEditingController cardHolderController = TextEditingController(text: "John Doe");
  TextEditingController expiryController = TextEditingController(text: "08/2026");
  TextEditingController cvvController = TextEditingController(text: "123");

  // FocusNodes pour la gestion du focus
  FocusNode cardNumberFocus = FocusNode();
  FocusNode cardHolderFocus = FocusNode();
  FocusNode expiryFocus = FocusNode();
  FocusNode cvvFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    cardNumberFocus.addListener(() => _handleFocus(cardNumberFocus, cardNumberController, "1234 5678 9012 3456"));
    cardHolderFocus.addListener(() => _handleFocus(cardHolderFocus, cardHolderController, "John Doe"));
    expiryFocus.addListener(() => _handleFocus(expiryFocus, expiryController, "08/2026"));
    cvvFocus.addListener(() => _handleFocus(cvvFocus, cvvController, "123"));
  }

  @override
  void dispose() {
    cardNumberFocus.dispose();
    cardHolderFocus.dispose();
    expiryFocus.dispose();
    cvvFocus.dispose();
    super.dispose();
  }

  void _handleFocus(FocusNode focusNode, TextEditingController controller, String defaultValue) {
    if (focusNode.hasFocus) {
      if (controller.text == defaultValue) {
        controller.clear();
      }
    } else {
      if (controller.text.isEmpty) {
        controller.text = defaultValue;
      }
    }
    setState(() {});
  }

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
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          "Add New Card",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCreditCard(),
              SizedBox(height: 20),
              _buildCardDetails(),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => AddCardScreen()),
);
                  },
                  child: Text("Confirmer"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, 
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildEditableField(Icons.person_outline, "Cardholder Name", cardHolderController, cardHolderFocus),
        Divider(thickness: 1, color: Colors.grey[300]),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: _buildEditableField(Icons.calendar_today_outlined, "Expiry Date", expiryController, expiryFocus)),
            SizedBox(width: 20),
            Expanded(child: _buildEditableField(Icons.lock_outline, "4-digit CVV", cvvController, cvvFocus)),
          ],
        ),
        Divider(thickness: 1, color: Colors.grey[300]),
        SizedBox(height: 10),
        _buildEditableField(Icons.credit_card_outlined, "Card Number", cardNumberController, cardNumberFocus),
        Divider(thickness: 1, color: Colors.grey[300]),
      ],
    );
  }

  Widget _buildEditableField(IconData icon, String label, TextEditingController controller, FocusNode focusNode) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            decoration: InputDecoration(
              labelText: label,
              border: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCreditCard() {
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
              "../assets/background.png",
              fit: BoxFit.cover,
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
                  cardNumberController.text,
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
                    cardHolderController.text,
                    style: const TextStyle(
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
                        Text("Expiry Date", style: TextStyle(color: Colors.grey, fontSize: 10)),
                        Text(expiryController.text, style: const TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CVV", style: TextStyle(color: Colors.grey, fontSize: 10)),
                        Text(cvvController.text, style: const TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                    Image.asset("../assets/mastercard_logo.png", width: 40, height: 40),
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
