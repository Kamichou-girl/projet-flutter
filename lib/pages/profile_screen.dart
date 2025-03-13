import 'package:flutter/material.dart';

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
          onPressed: () => Navigator.pushReplacementNamed(context, '/welcom'),
        ),
        title: Text("Profile", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.black),
            onPressed: () {
              // Action à définir pour modifier le profil
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
                    backgroundImage: AssetImage('assets/image/profile.png'), // Remplace par ton image
                  ),
                  SizedBox(height: 10),
                  Text("Tanya Myroniuk", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Senior Designer", style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildProfileOption(Icons.person, "Personal Information"),
            _buildProfileOption(Icons.payment, "Payment Preferences"),
            _buildProfileOption(Icons.credit_card, "Banks and Cards"),
            _buildProfileOption(Icons.notifications, "Notifications", badge: 2),
            _buildProfileOption(Icons.message, "Message Center"),
            _buildProfileOption(Icons.location_on, "Address"),
            _buildProfileOption(Icons.settings, "Settings"),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, {int? badge}) {
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
      onTap: () {
        // Action à définir si nécessaire
      },
    );
  }
}
