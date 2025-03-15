import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/send_money_screenbk.dart';
import '../widgets/popup.dart';
import '../pages/receive_money.dart';

class ActionButtons extends StatelessWidget {

 final Function(double, bool) updateBalance; // Ajout de updateBalance

  const ActionButtons({super.key, required this.updateBalance});


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
              MaterialPageRoute(builder: (context) =>  SendMoneyScreen(updateBalance: updateBalance)),
            );
          },
        ),
        ActionButton(
          icon: Icons.arrow_downward,
          label: "Receive",
          onPressed: () {
            Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ReceiveMoneyScreen(updateBalance: updateBalance)),
);
          },
        ),
        ActionButton(
  icon: Icons.monetization_on,
  label: "Loan",
  onPressed: () {
    showCustomPopup(context);
  },
),
        ActionButton(
          icon: Icons.cloud_upload,
          label: "Topup",
          onPressed: () {
                showCustomPopup(context);
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
