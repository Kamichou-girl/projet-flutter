import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/send_money_screenbk.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ActionButton(
          icon: Icons.arrow_upward,
          label: "Sent",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SendMoneyScreen()),
            );
          },
        ),
        ActionButton(
          icon: Icons.arrow_downward,
          label: "Receive",
          onPressed: () {
            print('Bouton Receive appuyé');
          },
        ),
        ActionButton(
          icon: Icons.monetization_on,
          label: "Loan",
          onPressed: () {
            print('Bouton Loan appuyé');
          },
        ),
        ActionButton(
          icon: Icons.cloud_upload,
          label: "Topup",
          onPressed: () {
            print('Bouton Topup appuyé');
          },
        ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed; // Ajout du callback

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(50),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(icon, color: Colors.black),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
