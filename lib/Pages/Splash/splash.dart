import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leagese/Pages/Onboard/Onboard_screen.dart';
import 'package:leagese/colors.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Lottie.asset(
              "assets/img/law.json",
              height: 300,
              width: 300,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Legease',
            style: GoogleFonts.poppins(
              color: MyColors.textPrimary,
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}
