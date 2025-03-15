import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Importation de la bibliothèque Google Fonts pour personnaliser les polices
import 'profile_screen.dart';
import 'setting_screen.dart';

// Classe principale pour l'édition du profil
class ProfileEditApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Désactive le bandeau "debug" dans l'application
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(), // Utilisation de la police Poppins pour l'ensemble de l'application
      ),
      home: EditProfileScreen(), // Définit l'écran principal comme étant celui d'édition de profil
    );
  }
}

// Écran d'édition de profil utilisant un StatefulWidget pour gérer les interactions utilisateur
class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController birthDateController;
  
  late FocusNode nameFocus;
  late FocusNode emailFocus;
  late FocusNode phoneFocus;
  late FocusNode birthDateFocus;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: "Tanya Myroniuk");
    emailController = TextEditingController(text: "tanya.myroniuk@gmail.com");
    phoneController = TextEditingController(text: "+225 0102030405");
    birthDateController = TextEditingController(text: "28 September 2000");
    
    nameFocus = FocusNode();
    emailFocus = FocusNode();
    phoneFocus = FocusNode();
    birthDateFocus = FocusNode();
    
    nameFocus.addListener(() => _handleFocus(nameFocus, nameController, "Tanya Myroniuk"));
    emailFocus.addListener(() => _handleFocus(emailFocus, emailController, "tanya.myroniuk@gmail.com"));
    phoneFocus.addListener(() => _handleFocus(phoneFocus, phoneController, "+225 0102030405"));
    birthDateFocus.addListener(() => _handleFocus(birthDateFocus, birthDateController, "28 September 2000"));
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
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    birthDateController.dispose();
    nameFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
    birthDateFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('../assets/toji.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Tanya Myroniuk",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Senior Designer",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            buildProfileField(Icons.person_outline, "Full Name", nameController, nameFocus, "Tanya Myroniuk"),
            buildProfileField(Icons.email_outlined, "Email Address", emailController, emailFocus, "tanya.myroniuk@gmail.com"),
            buildProfileField(Icons.phone_outlined, "Phone Number", phoneController, phoneFocus, "+225 0102030405"),
            buildProfileField(Icons.calendar_today_outlined, "Birth Date", birthDateController, birthDateFocus, "28 September 2000"),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Joined 28 Jan 2021",
                style: GoogleFonts.poppins(color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                
                onPressed: () {
                  
                  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SettingsScreen()),
);
                },
                child: Text("Enregistrer",style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black, // Couleur du texte
    ),
    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileField(IconData icon, String label, TextEditingController controller, FocusNode focusNode, String defaultValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[600]),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: (controller.text == defaultValue) ? Colors.grey : Colors.black,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.grey[600]),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
