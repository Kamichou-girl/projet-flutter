import 'package:flutter/material.dart';
import 'K_edit_profile_screen.dart';
import 'setting_screen.dart';
import '../widgets/popup.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsScreen()),
          ),
        ),
        title: Text("Profile", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileEditApp()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('../assets/toji.png'), // Remplace par ton image
                  ),
                  SizedBox(height: 10),
                  Text("Tanya Myroniuk", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Senior Designer", style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildProfileOption(Icons.person, "Personal Information", onTap: () {
              showCustomPopup(context); // Afficher le popup pour "Personal Information"
            }),
            _buildProfileOption(Icons.payment, "Payment Preferences", onTap: () {
              showCustomPopup(context); // Afficher le popup pour "Payment Preferences"
            }),
            _buildProfileOption(Icons.credit_card, "Cards", onTap: () {
              showCustomPopup(context); // Afficher le popup pour "Cards"
            }),
            _buildProfileOption(Icons.notifications, "Notifications", badge: 2, onTap: () {
              showCustomPopup(context); // Afficher le popup pour "Notifications"
            }),
            _buildProfileOption(Icons.message, "Message Center", onTap: () {
              showCustomPopup(context); // Afficher le popup pour "Message Center"
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, {int? badge, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (badge != null)
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text("$badge", style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
          SizedBox(width: 10),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
      onTap: onTap, // Appel du callback onTap pour chaque option
    );
  }
}
