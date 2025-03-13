// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/onboarding4_screen.dart';

/// Écran principal qui assemble toutes les sections
class Onboarding3Screen extends StatelessWidget {
  const Onboarding3Screen({super.key});

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
              // Illustration
              PaymentIllustration(),
              SizedBox(height: 40),

              // Titre
              TitleText(),
              SizedBox(height: 16),

              // Sous-titre
              SubtitleText(),
              SizedBox(height: 40),

              // Bouton "Next"
              NextButton(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget qui affiche l’illustration
class PaymentIllustration extends StatelessWidget {
  const PaymentIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    // Remplacez l’URL ci-dessous par l’illustration exacte
    // (ou utilisez un AssetImage si l’illustration est en local)
    return SizedBox(
      height: 250,
      child: Image.asset('assets/image/image3.png', width: 300),
    );
  }
}

/// Widget pour le titre principal
class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Paying for Everything is Easy and Convenient',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

/// Widget pour le sous-titre
class SubtitleText extends StatelessWidget {
  const SubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Built-in Fingerprint, face recognition and more, keeping you completely safe',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white70, fontSize: 16),
    );
  }
}

/// Widget pour le bouton "Next"
class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Onboarding4Screen()),
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
          'Next',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
