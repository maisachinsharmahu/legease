import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leagese/colors.dart';
import 'package:leagese/models/lawyer.dart';

class AnalysisPage extends StatelessWidget {
  final Lawyer lawyer;
  final Map<String, dynamic>? data;

  const AnalysisPage({super.key, required this.lawyer, this.data});

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // Safely parse the data from the JSON structure
    final clauseComparison = data?["Clause_Comparison"];
    final risk = data?["Risk_Assessment"];
    final insights = data?["Key_Insights"];
    final reviewMode = data?["Review_Mode"];

    // Calculate slider value from risk tolerance (assuming a 1-5 scale)
    final riskToleranceValue = (risk?['Risk_Tolerance'] as num? ?? 3.0);
    final sliderValue = (riskToleranceValue - 1) / 4;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              nav(context),
              const SizedBox(height: 20),

              // Clause Comparison Section
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
                      "Clause Comparison",
                      style: GoogleFonts.cabin(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Original Clause
                    Text(
                      "Original Clause",
                      style: GoogleFonts.cabin(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      clauseComparison?['Original_Clause'] ?? 'Not available.',
                      style: GoogleFonts.cabin(
                        fontSize: 14,
                        color: Colors.grey.shade400,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Suggested Clause
                    Text(
                      "Suggested Clause",
                      style: GoogleFonts.cabin(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      clauseComparison?['Suggested_Clause'] ?? 'Not available.',
                      style: GoogleFonts.cabin(
                        fontSize: 14,
                        color: Colors.green.shade300,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Market Benchmark
                    Text(
                      "Market Benchmark",
                      style: GoogleFonts.cabin(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      clauseComparison?['Market_Benchmark'] ?? 'Not available.',
                      style: GoogleFonts.cabin(
                        fontSize: 14,
                        color: Colors.grey.shade400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Risk Assessment Section
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
                      "Risk Assessment",
                      style: GoogleFonts.cabin(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Based on your document, here's a simulation of potential outcomes:",
                      style: GoogleFonts.cabin(
                        fontSize: 12,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "OUTCOME PROBABILITY",
                                      style: GoogleFonts.cabin(
                                        fontSize: 10,
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      risk?['Outcome_Probability'] ?? 'N/A',
                                      style: GoogleFonts.cabin(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // _buildBarChart("Low", 0.3, MyColors.primary),
                                  // _buildBarChart(
                                  //   "Medium",
                                  //   0.6,
                                  //   MyColors.primary,
                                  // ),
                                  // _buildBarChart("High", 0.9, MyColors.primary),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Risk Tolerance Slider
                    // Text(
                    //   "Risk Tolerance",
                    //   style: GoogleFonts.cabin(
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.w600,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    // const SizedBox(height: 12),
                    // SliderTheme(
                    //   data: SliderTheme.of(context).copyWith(
                    //     activeTrackColor: MyColors.primary,
                    //     inactiveTrackColor: Colors.grey.shade600,
                    //     thumbColor: MyColors.primary,
                    //     overlayColor: MyColors.primary.withOpacity(0.2),
                    //     trackHeight: 4,
                    //   ),
                    //   child: Slider(
                    //     value: sliderValue,
                    //     onChanged: (value) {},
                    //     min: 0,
                    //     max: 1,
                    //   ),
                    // ),
                    // const SizedBox(height: 20),

                    // Key Insights
                    Text(
                      "Key Insights",
                      style: GoogleFonts.cabin(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Financial Impact
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Iconsax.money_recive,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Potential Loss",
                                  style: GoogleFonts.cabin(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  insights?['Potential_Loss'] ??
                                      'Not available.',
                                  style: GoogleFonts.cabin(
                                    fontSize: 12,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Duration Impact
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Iconsax.clock,
                              color: Colors.orange,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Estimated Duration",
                                  style: GoogleFonts.cabin(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  insights?['Estimated_Duration'] ??
                                      'Not available.',
                                  style: GoogleFonts.cabin(
                                    fontSize: 12,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Document Review Section
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
                      "Review Mode",
                      style: GoogleFonts.cabin(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: MyColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Explain in Simpler Terms",
                            style: GoogleFonts.cabin(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Text(
                      reviewMode?['Explain_in_Simpler_Terms'] ??
                          'Not available.',
                      style: GoogleFonts.cabin(
                        fontSize: 14,
                        color: Colors.grey.shade400,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Voice Review Section
                    // Text(
                    //   "Voice Review",
                    //   style: GoogleFonts.cabin(
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.w600,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    // const SizedBox(height: 12),

                    // Container(
                    //   padding: const EdgeInsets.all(16),
                    //   decoration: BoxDecoration(
                    //     color: Colors.grey.withOpacity(0.1),
                    //     borderRadius: BorderRadius.circular(12),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         height: 50,
                    //         width: 50,
                    //         decoration: BoxDecoration(
                    //           color: MyColors.primary,
                    //           borderRadius: BorderRadius.circular(25),
                    //         ),
                    //         child: const Icon(
                    //           Iconsax.microphone,
                    //           color: Colors.white,
                    //           size: 24,
                    //         ),
                    //       ),
                    //       const SizedBox(width: 16),
                    //       Expanded(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               "AI-Generated Summary",
                    //               style: GoogleFonts.cabin(
                    //                 fontSize: 16,
                    //                 fontWeight: FontWeight.w600,
                    //                 color: Colors.white,
                    //               ),
                    //             ),
                    //             Text(
                    //               reviewMode?['Voice'] ?? 'Not available.',
                    //               style: GoogleFonts.cabin(
                    //                 fontSize: 12,
                    //                 color: Colors.grey.shade500,
                    //                 height: 1.4,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBarChart(String label, double height, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 30,
          height: height * 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.cabin(fontSize: 12, color: Colors.grey.shade400),
        ),
      ],
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
          "Analysis",
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
