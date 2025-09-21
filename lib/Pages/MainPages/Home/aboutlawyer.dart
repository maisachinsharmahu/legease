import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leagese/Pages/MainPages/Chatpage/Lawyerchat.dart';
import 'package:leagese/Pages/MainPages/Home/FileUploadPage.dart';
import 'package:leagese/Pages/Onboard/screen1.dart';
import 'package:leagese/colors.dart';
import 'package:leagese/models/lawyer.dart';

class Aboutlawyer extends StatelessWidget {
  final Lawyer lawyer;
  final Color bgColor;
  const Aboutlawyer({super.key, required this.lawyer, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Stack(
        children: [
          topgradient(),
          SingleChildScrollView(
            child: Stack(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        nav(context),
                        SizedBox(height: 20),
                        Stack(
                          children: [
                            Hero(
                              tag: lawyer.name,
                              child: Container(
                                height: 300,
                                width: Screensize.screenWidth(context) * 0.9,
                                decoration: BoxDecoration(
                                  color: bgColor.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(40),
                                  image: DecorationImage(
                                    image: AssetImage(lawyer.image),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 300,
                              width: Screensize.screenWidth(context) * 0.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 2,
                                ),
                                color: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        LawyerStatsCard(
                          analysisSpeed: lawyer.analysisSpeed,
                          accuracyRate: lawyer.accuracyRate,
                          documentsProcessed: lawyer.documentsProcessed
                              .toString(),
                        ),
                        SizedBox(height: 20),
                        Stack(
                          children: [
                            Container(
                              width: Screensize.screenWidth(context) * 0.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 0,
                                ),
                                color: Colors.white.withOpacity(0.08),
                              ),
                              child: Padding(
                                padding: EdgeInsetsGeometry.symmetric(
                                  horizontal: 26,
                                  vertical: 20,
                                ),
                                child: Text(
                                  lawyer.description,
                                  style: GoogleFonts.cabin(
                                    fontSize: 14,
                                    color: Colors.grey.shade400,
                                  ),
                                  // textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            // Navigate to file upload page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FileUploadPage(lawyer: lawyer),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: MyColors.primary,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Send Legal Document to ${lawyer.name}",
                                  style: GoogleFonts.cabin(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Positioned buttons to connect sections
                Positioned(
                  top:
                      MediaQuery.of(context).padding.top +
                      75 +
                      295, // After SafeArea + nav + image + half spacing
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade700,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        lawyer.type,
                        style: GoogleFonts.cabin(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top:
                      MediaQuery.of(context).padding.top +
                      75 +
                      300 +
                      40 +
                      70, // After first button + spacing + stats card + half spacing
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: MyColors.textPrimary,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        'About Lawyer',
                        style: GoogleFonts.cabin(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   top: MediaQuery.of(context).padding.top ,
                //   child: Container(height: 300, width: 300, color: Colors.red),
                // ),
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
              lawyer.name,
              style: GoogleFonts.cabin(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              lawyer.type,
              style: GoogleFonts.cabin(
                fontSize: 14,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            // Navigate to file upload page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LawyerChat(lawyer: lawyer),
              ),
            );
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: MyColors.textPrimary.withOpacity(0.28),
            ),
            child: const Icon(Iconsax.message, color: Colors.white),
          ),
        ),
        // const SizedBox(width: 10),
        // Container(
        //   height: 35,
        //   width: 35,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(40),
        //     color: MyColors.textPrimary.withOpacity(0.28),
        //   ),
        //   child: const Icon(
        //     Icons.notifications_none_outlined,
        //     color: Colors.white,
        //   ),
        // ),
      ],
    );
  }
}

class LawyerStatsCard extends StatelessWidget {
  final String analysisSpeed;
  final String accuracyRate;
  final String documentsProcessed;

  const LawyerStatsCard({
    Key? key,
    required this.analysisSpeed,
    required this.accuracyRate,
    required this.documentsProcessed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 0),
            color: Colors.white.withOpacity(0.08),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Analysis Speed
                Column(
                  children: [
                    Text(
                      'Analysis Speed',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      analysisSpeed,
                      style: const TextStyle(
                        color: MyColors.primaryLight,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // Accuracy Rate
                Column(
                  children: [
                    Text(
                      'Accuracy Rate',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      accuracyRate,
                      style: const TextStyle(
                        color: MyColors.primaryLight,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),

                // Documents Processed
                Column(
                  children: [
                    Text(
                      'Docs Processed',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      documentsProcessed,
                      style: const TextStyle(
                        color: MyColors.primaryLight,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
