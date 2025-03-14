import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/change_password.dart';
import 'package:flutter_application_1/pages/langue.dart'; // Chemin vers LanguageSelectionScreen
import 'package:flutter_application_1/pages/onboarding4_screen.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import '../widgets/popup.dart'; // Importez le fichier popup.dart
// Assurez-vous que SignUpScreen est bien importé

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = "English"; // Langue par défaut

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          // Retour vers HomeScreen
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "General",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            // Option Language
            _buildSettingsOption(
              "Language",
              _selectedLanguage,
              onTap: () async {
                final selectedLang = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LanguageSelectionScreen(
                      onLanguageSelected: (language) {
                        Navigator.pop(context, language.name);
                      },
                    ),
                  ),
                );
                if (selectedLang != null) {
                  setState(() {
                    _selectedLanguage = selectedLang;
                  });
                }
              },
            ),
            _buildSettingsOption("My Profile", "", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            }),
            // Appelez le popup pour "Contact Us"
            _buildSettingsOption("Contact Us", "", onTap: () {
              showCustomPopup(context); // Afficher le popup ici
            }),
            const SizedBox(height: 20),
            const Text(
              "Security",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            // Change Password
            _buildSettingsOption("Change Password", "", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChangePasswordScreen()),
              );
            }),
            // Appelez le popup pour "Privacy Policy"
            _buildSettingsOption("Privacy Policy", "", onTap: () {
              showCustomPopup(context); // Afficher le popup ici aussi
            }),
            const SizedBox(height: 20),
            const Text(
              "Choose what data you share with us",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            ListTile(
              title: const Text("Biometric"),
              trailing: Switch(
                value: false,
                onChanged: (bool value) {},
              ),
            ),

            // Bouton de Déconnexion
            const SizedBox(height: 20),
            ListTile(
              title: const Text(
                "Log Out",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:
                      Colors.red, // Couleur rouge pour le bouton de déconnexion
                ),
              ),
              leading: const Icon(Icons.logout, color: Colors.red),
              onTap: () {
                _showLogoutDialog(
                    context); // Ouvre la boîte de dialogue de confirmation
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
    );
  }

  /// Fonction pour construire chaque option de la liste des paramètres
  Widget _buildSettingsOption(String title, String value,
      {VoidCallback? onTap}) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (value.isNotEmpty)
            Text(value,
                style: const TextStyle(color: Colors.grey, fontSize: 14)),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
      onTap: onTap,
    );
  }

  /// Fonction pour afficher la boîte de dialogue de confirmation de déconnexion
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text("Log Out"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Fermer le popup
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fermer le popup
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Onboarding4Screen()),
                ); // Rediriger vers SignUp
              },
              child: const Text("Log Out", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
