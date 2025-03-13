import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/onboarding2_screen.dart'
    show Onboarding2Screen;

/// Écran principal qui assemble toutes les sections
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

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
  const PaymentIllustration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Remplacez l’URL ci-dessous par l’illustration exacte
    // (ou utilisez un AssetImage si l’illustration est en local)
    return SizedBox(
      height: 250,
      child: Image.asset('assets/image/tt.png', width: 300),
    );
  }
}

/// Widget pour le titre principal
class TitleText extends StatelessWidget {
  const TitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Fastest Payment in the world',
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
  const SubtitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Integrate multiple payment methods to help you up the process quickly',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white70, fontSize: 16),
    );
  }
}

/// Widget pour le bouton "Next"
class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Onboarding2Screen()),
          );
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
