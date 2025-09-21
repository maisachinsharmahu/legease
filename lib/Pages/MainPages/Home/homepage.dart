import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leagese/Pages/MainPages/Home/DoYouknow.dart';
import 'package:leagese/Pages/MainPages/Home/aboutlawyer.dart';
import 'package:leagese/Pages/MainPages/Home/legalliteracypage.dart';
import 'package:leagese/Pages/MainPages/fileupload.dart';
import 'package:leagese/Pages/Onboard/screen1.dart';
import 'package:leagese/colors.dart';
import 'package:leagese/models/lawyer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Color> cardColors = const [
    Color(0xFFE8D5E8), // Soft Lavender Pink
    Color(0xFFD5E8F4), // Soft Sky Blue
    Color(0xFFF4E8D5), // Soft Peach
    Color(0xFFE8F4D5), // Soft Mint Green
    Color(0xFFF4D5E8), // Soft Rose Pink
    Color(0xFFD5F4E8), // Soft Aqua
    Color(0xFFF4F4D5), // Soft Cream Yellow
    Color(0xFFE8E8F4), // Soft Periwinkle
    Color(0xFFF4E8E8), // Soft Blush
    Color(0xFFE8F4F4), // Soft Ice Blue
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Stack(
        children: [
          topgradient(context),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: nav(context),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          // Navigation Header

                          // Content Section
                          Container(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Legal Help, Your Way",
                                  style: GoogleFonts.cabin(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "Meet Our Top Class Lawyers",
                                  style: GoogleFonts.cabin(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),
                          LawCards(cardColors: cardColors),
                          const SizedBox(height: 20),
                          FileUploadWidget(),
                          const SizedBox(height: 20),

                          // ✅ ADD THIS: Bottom padding to prevent overlap with navigation bar
                          Container(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Do You Know?",
                                      style: GoogleFonts.cabin(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => LegalLiteracyPage(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          color: MyColors.textPrimary
                                              .withOpacity(0.2),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4.0,
                                            horizontal: 12,
                                          ),
                                          child: Text(
                                            "View All",
                                            style: GoogleFonts.cabin(
                                              fontSize: 14,
                                              color: Colors.grey.shade300,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Stay informed with quick legal facts to keep your documents safe.",
                                  style: GoogleFonts.cabin(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                LegalFactsFlashCardSection(),
                              ],
                            ),
                          ), // Space for bottom navigation
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget topgradient(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            MyColors.primary.withOpacity(0.8),
            MyColors.primary.withOpacity(0.4),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  Row nav(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        Text(
          "",
          style: GoogleFonts.cabin(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class LawCards extends StatelessWidget {
  const LawCards({super.key, required this.cardColors});

  final List<Color> cardColors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: lawyers.length,
        itemBuilder: (context, index) {
          final lawyer = lawyers[index];
          final bgColor = cardColors[index % cardColors.length];

          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Material(
                color: Colors.transparent, // make Material transparent
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            Aboutlawyer(lawyer: lawyer, bgColor: bgColor),
                      ),
                    );
                  },
                  child: Hero(
                    tag: lawyer.name,
                    child: Material(
                      type: MaterialType.transparency,

                      child: Container(
                        width: 120,
                        height: 140,
                        decoration: BoxDecoration(color: bgColor),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                lawyer.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 60,
                                alignment: Alignment.bottomLeft,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.1),
                                      Colors.black.withOpacity(0.4),
                                      Colors.black.withOpacity(0.7),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      lawyer.name,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(0, 1),
                                            blurRadius: 3,
                                            color: Colors.black54,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      lawyer.type,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: MyColors.primaryLight,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Border container should be transparent to allow taps
                            Container(
                              width: 120,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 1,
                                ),
                                color: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
