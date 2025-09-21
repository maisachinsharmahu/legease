import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leagese/colors.dart';
import 'package:leagese/models/lawyer.dart';

class ReviewModePage extends StatelessWidget {
  final Lawyer lawyer;
  final Map<String, dynamic>? data;

  const ReviewModePage({super.key, required this.lawyer, this.data});

  @override
  Widget build(BuildContext context) {
    if (data == null || data!.isEmpty) {
      return const Center(child: Text("No review data available."));
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              nav(context),
              const SizedBox(height: 20),

              // Header Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Document Review",
                      style: GoogleFonts.cabin(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Key excerpts from your document, grouped by topic.",
                      style: GoogleFonts.cabin(
                        fontSize: 14,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // MODIFIED: Dynamically generate cards from data
              ...data!.entries.map((entry) {
                final title = entry.key;
                final details = List<String>.from(entry.value);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _buildClauseCard(title: title, details: details),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  // MODIFIED: This widget is now simpler and only requires a title and details.
  Widget _buildClauseCard({
    required String title,
    required List<String> details,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // // Document preview placeholder (no changes here)
          // Container(
          //   width: double.infinity,
          //   height: 120,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(12),
          //     gradient: LinearGradient(
          //       colors: [
          //         Colors.grey.shade800.withOpacity(0.5),
          //         Colors.grey.shade900.withOpacity(0.8),
          //       ],
          //       begin: Alignment.topLeft,
          //       end: Alignment.bottomRight,
          //     ),
          //   ),
          //   child: Center(
          //     child: Container(
          //       width: 70,
          //       height: 90,
          //       decoration: BoxDecoration(
          //         color: Colors.white.withOpacity(0.9),
          //         borderRadius: BorderRadius.circular(4),
          //         border: Border.all(color: Colors.grey.shade400),
          //       ),
          //       child: Column(
          //         children: [
          //           Container(
          //             height: 10,
          //             margin: const EdgeInsets.all(4),
          //             color: Colors.grey.shade600,
          //           ),
          //           Expanded(
          //             child: Padding(
          //               padding: const EdgeInsets.symmetric(horizontal: 4.0),
          //               child: Column(
          //                 children: List.generate(8, (index) {
          //                   return Container(
          //                     height: 2,
          //                     margin: const EdgeInsets.only(bottom: 4),
          //                     color: Colors.grey.shade400,
          //                   );
          //                 }),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 20),

          // Title
          Text(
            title,
            style: GoogleFonts.cabin(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),

          // Details list as a bulleted list
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: details.map((detail) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                      child: Text(
                        "•",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        detail,
                        style: GoogleFonts.cabin(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Row nav(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: MyColors.textPrimary.withOpacity(0.28),
            ),
            child: const Icon(
              Iconsax.arrow_left_2,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Text(
          "Document Review",
          style: GoogleFonts.cabin(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: MyColors.textPrimary.withOpacity(0.28),
          ),
          child: const Icon(Iconsax.more, color: Colors.white, size: 20),
        ),
      ],
    );
  }
}
