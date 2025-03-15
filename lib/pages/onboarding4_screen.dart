import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_screen.dart';
import 'package:flutter_application_1/pages/onboarding5_screen.dart';

/// Écran de connexion pour l'Onboarding 4
class Onboarding4Screen extends StatelessWidget {
  const Onboarding4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // Titre de l'écran de connexion
              Onboarding4Title(),
              SizedBox(height: 40),

              // Champ de saisie de l'email
              Onboarding4EmailInput(),
              SizedBox(height: 20),

              // Champ de saisie du mot de passe
              Onboarding4PasswordInput(),
              SizedBox(height: 40),

              // Bouton de connexion
              Onboarding4SignInButton(),
              SizedBox(height: 20),

              // Lien pour les nouveaux utilisateurs
              Onboarding4NewUserLink(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget pour le titre de l'écran de connexion
class Onboarding4Title extends StatelessWidget {
  const Onboarding4Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Sign In',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

/// Widget pour le champ de saisie de l'email
class Onboarding4EmailInput extends StatelessWidget {
  const Onboarding4EmailInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Email Address',
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}

/// Widget pour le champ de saisie du mot de passe
class Onboarding4PasswordInput extends StatelessWidget {
  const Onboarding4PasswordInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}

/// Widget pour le bouton de connexion
class Onboarding4SignInButton extends StatelessWidget {
  const Onboarding4SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  HomeScreen()),
          );
          //
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0D6CFF), // Couleur bleue du bouton
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Text(
          'Sign In',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}

/// Widget pour le lien des nouveaux utilisateurs
class Onboarding4NewUserLink extends StatelessWidget {
  const Onboarding4NewUserLink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Onboarding5Screen()),
        );
      },
      child: const Text(
        "I'm a new user. Sign In",
        style: TextStyle(color: Colors.white70),
      ),
    );
  }
}
