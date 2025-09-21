import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leagese/Pages/MainPages/Home/DoYouknow%20copy.dart';
import 'package:leagese/Pages/Onboard/screen1.dart';
import 'package:leagese/colors.dart';

class LegalLiteracyPage extends StatefulWidget {
  const LegalLiteracyPage({super.key});

  @override
  State<LegalLiteracyPage> createState() => _LegalLiteracyPageState();
}

class _LegalLiteracyPageState extends State<LegalLiteracyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,

      body: Stack(
        children: [
          topgradient(),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: nav(context),
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(child: DoYouKnow2()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row nav(BuildContext context) {
    return Row(
      children: [
        // Image.asset("assets/img/top.png", height: 32),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: MyColors.textPrimary.withOpacity(0.28),
            ),
            child: const Icon(Iconsax.arrow_left_2, color: Colors.white),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Legal Literacy",
              style: GoogleFonts.cabin(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
       
      ],
    );
  }
}
