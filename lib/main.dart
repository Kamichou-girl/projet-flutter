import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/onboarding_sreen.dart';

import 'pages/home_screen.dart';
import 'pages/my_cards_screen.dart';
import 'pages/profile_screen.dart';
import 'pages/setting_screen.dart';
import 'pages/statistics_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      // On commence par le SplashScreen
      routes: {
        '/welcom': (context) => HomeScreen(),
        '/statistics': (context) => StatisticsScreen(),
        '/mycards': (context) => MyCardsScreen(),
        '/settings': (context) => SettingsScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

// =====================
// 🌟 Écran SplashScreen
// =====================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Assurer que la navigation se fait après le rendu du widget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 3), () {
        debugPrint("✅ Navigation vers OnboardingScreen");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/image.png', //www.figma.com/design/fdf1lzJNDqKi2jGyldGdpE/Seven's-Banking?node-id=1-6951&t=WFE0891Ve6GAS4JS-4
              width: 150,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, color: Colors.red, size: 50);
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'BANKPICK',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================
// 🎨 Écran OnboardingScreen
// ======================
