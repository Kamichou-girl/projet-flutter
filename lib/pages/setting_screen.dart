import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/change_password.dart';
import 'package:flutter_application_1/pages/langue.dart'; // Chemin vers LanguageSelectionScreen
// Assure-toi que ChangePasswordScreen est défini ici
import '../widgets/bottom_nav_bar.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

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
          // Retour vers HomeScreen, selon ton code de base
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
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner, color: Colors.black),
            onPressed: () {
              // Action pour scanner un QR code
            },
          ),
        ],
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
            _buildSettingsOption("Contact Us", ""),
            const SizedBox(height: 20),
            const Text(
              "Security",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            // Ici, on ajoute la navigation vers ChangePasswordScreen
            _buildSettingsOption("Change Password", "", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChangePasswordScreen()),
              );
            }),
            _buildSettingsOption("Privacy Policy", ""),
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
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
    );
  }

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
}
