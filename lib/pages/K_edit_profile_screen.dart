import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Importation de la bibliothèque Google Fonts pour personnaliser les polices
import 'profile_screen.dart';

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
  // Déclaration des contrôleurs pour les champs de texte
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController birthDateController;

  // Déclaration des FocusNodes pour gérer la mise au point des champs
  late FocusNode nameFocus;
  late FocusNode emailFocus;
  late FocusNode phoneFocus;
  late FocusNode birthDateFocus;

  @override
  void initState() {
    super.initState();

    // Initialisation des contrôleurs avec des valeurs par défaut
    nameController = TextEditingController(text: "Tanya Myroniuk");
    emailController = TextEditingController(text: "tanya.myroniuk@gmail.com");
    phoneController = TextEditingController(text: "+225 0102030405");
    birthDateController = TextEditingController(text: "28 September 2000");

    // Initialisation des FocusNodes
    nameFocus = FocusNode();
    emailFocus = FocusNode();
    phoneFocus = FocusNode();
    birthDateFocus = FocusNode();

    // Ajout d'écouteurs aux FocusNodes pour gérer le comportement des champs
    nameFocus.addListener(() => _handleFocus(nameFocus, nameController, "Tanya Myroniuk"));
    emailFocus.addListener(() => _handleFocus(emailFocus, emailController, "tanya.myroniuk@gmail.com"));
    phoneFocus.addListener(() => _handleFocus(phoneFocus, phoneController, "+225 0102030405"));
    birthDateFocus.addListener(() => _handleFocus(birthDateFocus, birthDateController, "28 September 2000"));
  }

  // Fonction pour gérer la mise au point des champs
  void _handleFocus(FocusNode focusNode, TextEditingController controller, String defaultValue) {
    if (focusNode.hasFocus) {
      if (controller.text == defaultValue) {
        controller.clear(); // Efface le champ lorsqu'il est sélectionné
      }
    } else {
      if (controller.text.isEmpty) {
        controller.text = defaultValue; // Réinsère la valeur par défaut si le champ est vide
      }
    }
    setState(() {}); // Rafraîchit l'affichage
  }

  @override
  void dispose() {
    // Nettoyage des contrôleurs et FocusNodes pour éviter les fuites de mémoire
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
      backgroundColor: Colors.white, // Fond blanc pour l'écran
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Supprime l'ombre de l'AppBar
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200], // Fond gris clair pour le bouton retour
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black), // Icône retour
            onPressed: () {
              Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ProfileScreen()),
);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0), // Ajoute du padding autour du contenu
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('../assets/toji.png'), // Image de profil
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
            // Champs d'édition du profil
            buildProfileField(Icons.person_outline, "Full Name", nameController, nameFocus, "Tanya Myroniuk"),
            buildProfileField(Icons.email_outlined, "Email Address", emailController, emailFocus, "tanya.myroniuk@gmail.com"),
            buildProfileField(Icons.phone_outlined, "Phone Number", phoneController, phoneFocus, "+225 0102030405"),
            buildProfileField(Icons.calendar_today_outlined, "Birth Date", birthDateController, birthDateFocus, "28 September 2000"),
            SizedBox(height: 20),
            // Date d'inscription affichée en bas de l'écran
            Center(
              child: Text(
                "Joined 28 Jan 2021",
                style: GoogleFonts.poppins(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fonction pour générer un champ d'édition avec une icône et un label
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
            color: (controller.text == defaultValue) ? Colors.grey : Colors.black, // Gris si valeur par défaut
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.grey[600]), // Ajoute une icône au début du champ
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2), // Bordure bleue lorsque le champ est sélectionné
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10), // Ajuste l'espacement interne du champ
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
