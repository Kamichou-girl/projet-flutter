import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacementNamed(context, '/welcom'),
        ),
        title: Text("Settings", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code_scanner, color: Colors.black),
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
            Text("General", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
            _buildSettingsOption("Language", "English"),
            _buildSettingsOption("My Profile", "", onTap: () {
  Navigator.pushNamed(context, '/profile');
}),
            _buildSettingsOption("Contact Us", ""),
            SizedBox(height: 20),
            Text("Security", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
            _buildSettingsOption("Change Password", ""),
            _buildSettingsOption("Privacy Policy", ""),
            SizedBox(height: 20),
            Text("Choose what data you share with us", style: TextStyle(color: Colors.grey, fontSize: 12)),
            ListTile(
              title: Text("Biometric"),
              trailing: Switch(value: false, onChanged: (bool value) {}),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 3), // Sélectionne l'onglet "Settings"
    );
  }

  Widget _buildSettingsOption(String title, String value, {VoidCallback? onTap}) {
  return ListTile(
    title: Text(title, style: TextStyle(fontSize: 16)),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (value.isNotEmpty) Text(value, style: TextStyle(color: Colors.grey, fontSize: 14)),
        Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ],
    ),
    onTap: onTap, // Ajout de l'action onTap
  );
}

}
