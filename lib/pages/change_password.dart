import 'package:flutter/material.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  // Contrôleurs pour récupérer ou manipuler le texte si nécessaire
 
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Gérer la visibilité du “New Password”
  bool _showNewPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // --- AppBar ---
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Change Password',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // --- Contenu principal ---
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            // --- 1) Current Password ---
          

            // --- 2) New Password (avec icône œil) ---
            _buildLabelField(
              labelText: 'New Password',
              controller: _newPasswordController,
              isObscure: !_showNewPassword, // Si false => obscure
              suffixIcon: IconButton(
                icon: Icon(
                  _showNewPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() => _showNewPassword = !_showNewPassword);
                },
              ),
            ),

            // --- 3) Cofirm New Password ---
            _buildLabelField(
              labelText: 'Cofirm New Password',
              controller: _confirmPasswordController,
              isObscure: true,
            ),

            // Petit texte en bas
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Both Passwords Must Match',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ),

            // Espace avant le bouton
            const SizedBox(height: 32),

            // --- Bouton "Change Password" ---
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF007BFF), // Bleu vif
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Action du bouton
                },
                child: const Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 16, // Ajustez selon préférence
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget de construction pour chaque champ
  Widget _buildLabelField({
    required String labelText,
    required TextEditingController controller,
    bool isObscure = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            labelText,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

        // Row contenant l'icône + TextField
        Row(
          children: [
            // Icône cadenas
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.lock_outline, color: Colors.grey),
            ),

            // TextField en Expanded
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: isObscure,
                decoration: InputDecoration(
                  hintText: '••••••••',
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: InputBorder.none, // pas de bordure
                  suffixIcon: suffixIcon, // éventuellement l'icône œil
                ),
              ),
            ),
          ],
        ),

        // Ligne de séparation fine
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey.shade200,
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}
