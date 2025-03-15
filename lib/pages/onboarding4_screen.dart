import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_screen.dart';
import 'package:flutter_application_1/pages/onboarding5_screen.dart';

/// Écran de connexion pour l'Onboarding 4
class Onboarding4Screen extends StatefulWidget {
  const Onboarding4Screen({super.key});

  @override
  _Onboarding4ScreenState createState() => _Onboarding4ScreenState();
}

class _Onboarding4ScreenState extends State<Onboarding4Screen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = ''; // Message d'erreur affiché en cas de mauvais identifiants

  void _handleSignIn() {
    if (_emailController.text == "admin" && _passwordController.text == "admin") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      setState(() {
        _errorMessage = "Invalid email or password!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Titre
              const Onboarding4Title(),
              const SizedBox(height: 40),

              // Email Input
              Onboarding4EmailInput(controller: _emailController),
              const SizedBox(height: 20),

              // Password Input
              Onboarding4PasswordInput(controller: _passwordController),
              const SizedBox(height: 10),

              // Message d'erreur
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              const SizedBox(height: 30),

              // Bouton de connexion
              Onboarding4SignInButton(onPressed: _handleSignIn),
              const SizedBox(height: 20),

              // Lien pour les nouveaux utilisateurs
              const Onboarding4NewUserLink(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget pour le titre
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

/// Widget pour le champ email avec un contrôleur
class Onboarding4EmailInput extends StatelessWidget {
  final TextEditingController controller;
  const Onboarding4EmailInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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

/// Widget pour le champ mot de passe avec un contrôleur
class Onboarding4PasswordInput extends StatelessWidget {
  final TextEditingController controller;
  const Onboarding4PasswordInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
  final VoidCallback onPressed;
  const Onboarding4SignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0D6CFF),
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
  const Onboarding4NewUserLink({super.key});

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
        "I'm a new user. Sign Up",
        style: TextStyle(color: Colors.white70),
      ),
    );
  }
}
