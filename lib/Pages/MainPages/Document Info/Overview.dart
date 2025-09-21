import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leagese/colors.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:leagese/models/lawyer.dart';

// Individual page widgets
class OverviewPage extends StatelessWidget {
  final Lawyer lawyer;
  final String? name;
  final Map<String, dynamic>? data;

  const OverviewPage({super.key, required this.lawyer, this.data, this.name});

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final risk = data!["Risk_Assessment"];
    final keyTerms = data!["Key_Terms"];
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              nav(context),
              // Document Header Section
              SizedBox(height: 20),

              // Container(
              //   width: double.infinity,
              //   height: 120,
              //   padding: const EdgeInsets.all(20),
              //   decoration: BoxDecoration(
              //     color: Colors.grey.withOpacity(0.1),
              //     // color: MyColors.textSecondary.withOpacity(0.08),
              //     borderRadius: BorderRadius.circular(16),
              //     boxShadow: [],
              //   ),
              //   child: Row(
              //     children: [
              //       // Document Icon
              //       Container(
              //         height: 60,
              //         width: 60,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(12),
              //           color: Colors.grey.shade700,
              //         ),
              //         child: const Icon(
              //           Iconsax.document_text,
              //           color: Colors.white,
              //           size: 30,
              //         ),
              //       ),
              //       const SizedBox(width: 15),
              //       // Document Details
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             name ?? "Lease Agreement",
              //             style: GoogleFonts.cabin(
              //               fontSize: 24,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white,
              //             ),
              //           ),
              //           const SizedBox(height: 4),
              //           Text(
              //             "12 pages",
              //             style: GoogleFonts.cabin(
              //               fontSize: 14,
              //               color: Colors.grey.shade400,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 20),
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
                child: Row(
                  children: [
                    // Lawyer Avatar
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            MyColors.primary.withOpacity(0.8),
                            MyColors.primary,
                          ],
                        ),
                      ),
                      child: Image.asset(lawyer.image, fit: BoxFit.fitWidth),
                    ),
                    const SizedBox(width: 15),
                    // Lawyer Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            lawyer.name,
                            style: GoogleFonts.cabin(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            lawyer.type,
                            style: GoogleFonts.cabin(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              ContractOverview(data: data),

              // // Risk Assessment Section
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.all(20),
              //   decoration: BoxDecoration(
              //     color: Colors.grey.withOpacity(0.1),
              //     borderRadius: BorderRadius.circular(16),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.3),
              //         blurRadius: 10,
              //         offset: const Offset(0, 4),
              //       ),
              //     ],
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Risk Assessment",
              //         style: GoogleFonts.cabin(
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.white,
              //         ),
              //       ),
              //       const SizedBox(height: 16),
              //       // Overall Risk
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             "Overall Risk",
              //             style: GoogleFonts.cabin(
              //               fontSize: 16,
              //               color: Colors.grey.shade400,
              //             ),
              //           ),
              //           Container(
              //             padding: const EdgeInsets.symmetric(
              //               horizontal: 12,
              //               vertical: 4,
              //             ),
              //             decoration: BoxDecoration(
              //               color: Colors.amber.withOpacity(0.2),
              //               borderRadius: BorderRadius.circular(20),
              //             ),
              //             child: Row(
              //               mainAxisSize: MainAxisSize.min,
              //               children: [
              //                 Container(
              //                   height: 8,
              //                   width: 8,
              //                   decoration: const BoxDecoration(
              //                     color: Colors.amber,
              //                     shape: BoxShape.circle,
              //                   ),
              //                 ),
              //                 const SizedBox(width: 6),
              //                 Text(
              //                   "Caution",
              //                   style: GoogleFonts.cabin(
              //                     fontSize: 14,
              //                     color: Colors.amber,
              //                     fontWeight: FontWeight.w600,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //       const SizedBox(height: 12),
              //       // Confidence
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             "Confidence",
              //             style: GoogleFonts.cabin(
              //               fontSize: 16,
              //               color: Colors.grey.shade400,
              //             ),
              //           ),
              //           Container(
              //             padding: const EdgeInsets.symmetric(
              //               horizontal: 12,
              //               vertical: 4,
              //             ),
              //             decoration: BoxDecoration(
              //               color: Colors.green.withOpacity(0.2),
              //               borderRadius: BorderRadius.circular(20),
              //             ),
              //             child: Row(
              //               mainAxisSize: MainAxisSize.min,
              //               children: [
              //                 Container(
              //                   height: 8,
              //                   width: 8,
              //                   decoration: const BoxDecoration(
              //                     color: Colors.green,
              //                     shape: BoxShape.circle,
              //                   ),
              //                 ),
              //                 const SizedBox(width: 6),
              //                 Text(
              //                   "High",
              //                   style: GoogleFonts.cabin(
              //                     fontSize: 14,
              //                     color: Colors.green,
              //                     fontWeight: FontWeight.w600,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),

              // const SizedBox(height: 20),

              // // Key Terms Section
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.all(20),
              //   decoration: BoxDecoration(
              //     color: Colors.grey.withOpacity(0.1),
              //     borderRadius: BorderRadius.circular(16),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.3),
              //         blurRadius: 10,
              //         offset: const Offset(0, 4),
              //       ),
              //     ],
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Key Terms",
              //         style: GoogleFonts.cabin(
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.white,
              //         ),
              //       ),
              //       const SizedBox(height: 20),

              //       // Lease Term
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 "Lease Term",
              //                 style: GoogleFonts.cabin(
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.w600,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //               Container(
              //                 padding: const EdgeInsets.symmetric(
              //                   horizontal: 12,
              //                   vertical: 4,
              //                 ),
              //                 decoration: BoxDecoration(
              //                   color: Colors.amber.withOpacity(0.2),
              //                   borderRadius: BorderRadius.circular(20),
              //                 ),
              //                 child: Row(
              //                   mainAxisSize: MainAxisSize.min,
              //                   children: [
              //                     Container(
              //                       height: 8,
              //                       width: 8,
              //                       decoration: const BoxDecoration(
              //                         color: Colors.amber,
              //                         shape: BoxShape.circle,
              //                       ),
              //                     ),
              //                     const SizedBox(width: 6),
              //                     Text(
              //                       "Caution",
              //                       style: GoogleFonts.cabin(
              //                         fontSize: 14,
              //                         color: Colors.amber,
              //                         fontWeight: FontWeight.w600,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //           const SizedBox(height: 4),
              //           Text(
              //             "12 months",
              //             style: GoogleFonts.cabin(
              //               fontSize: 14,
              //               color: Colors.grey.shade400,
              //             ),
              //           ),
              //         ],
              //       ),

              //       const SizedBox(height: 20),

              //       // Rent
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 "Rent",
              //                 style: GoogleFonts.cabin(
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.w600,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //               Container(
              //                 padding: const EdgeInsets.symmetric(
              //                   horizontal: 12,
              //                   vertical: 4,
              //                 ),
              //                 decoration: BoxDecoration(
              //                   color: Colors.green.withOpacity(0.2),
              //                   borderRadius: BorderRadius.circular(20),
              //                 ),
              //                 child: Row(
              //                   mainAxisSize: MainAxisSize.min,
              //                   children: [
              //                     Container(
              //                       height: 8,
              //                       width: 8,
              //                       decoration: const BoxDecoration(
              //                         color: Colors.green,
              //                         shape: BoxShape.circle,
              //                       ),
              //                     ),
              //                     const SizedBox(width: 6),
              //                     Text(
              //                       "Safe",
              //                       style: GoogleFonts.cabin(
              //                         fontSize: 14,
              //                         color: Colors.green,
              //                         fontWeight: FontWeight.w600,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //           const SizedBox(height: 4),
              //           Text(
              //             "\$2,500/month",
              //             style: GoogleFonts.cabin(
              //               fontSize: 14,
              //               color: Colors.grey.shade400,
              //             ),
              //           ),
              //         ],
              //       ),

              //       const SizedBox(height: 20),

              //       // Security Deposit
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 "Security Deposit",
              //                 style: GoogleFonts.cabin(
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.w600,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //               Container(
              //                 padding: const EdgeInsets.symmetric(
              //                   horizontal: 12,
              //                   vertical: 4,
              //                 ),
              //                 decoration: BoxDecoration(
              //                   color: Colors.red.withOpacity(0.2),
              //                   borderRadius: BorderRadius.circular(20),
              //                 ),
              //                 child: Row(
              //                   mainAxisSize: MainAxisSize.min,
              //                   children: [
              //                     Container(
              //                       height: 8,
              //                       width: 8,
              //                       decoration: const BoxDecoration(
              //                         color: Colors.red,
              //                         shape: BoxShape.circle,
              //                       ),
              //                     ),
              //                     const SizedBox(width: 6),
              //                     Text(
              //                       "High Risk",
              //                       style: GoogleFonts.cabin(
              //                         fontSize: 14,
              //                         color: Colors.red,
              //                         fontWeight: FontWeight.w600,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //           const SizedBox(height: 4),
              //           Text(
              //             "1 month's rent",
              //             style: GoogleFonts.cabin(
              //               fontSize: 14,
              //               color: Colors.grey.shade400,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
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
          name ?? "Document Info",
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

class ContractOverview extends StatelessWidget {
  final Map<String, dynamic>? data;

  const ContractOverview({Key? key, required this.data}) : super(key: key);

  // Helper widget to build the status tags dynamically
  Widget _buildStatusTag(String? text) {
    Color backgroundColor;
    Color textColor;
    String displayText = text ?? 'N/A'; // Handle null case

    switch (displayText.toLowerCase()) {
      case 'high':
        backgroundColor = Colors.red.withOpacity(0.2);
        textColor = Colors.red;
        break;
      case 'medium':
        backgroundColor = Colors.amber.withOpacity(0.2);
        textColor = Colors.amber;
        break;
      case 'low':
      case 'safe':
        backgroundColor = Colors.green.withOpacity(0.2);
        textColor = Colors.green;
        break;
      default:
        backgroundColor = Colors.grey.withOpacity(0.2);
        textColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(color: textColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            displayText,
            style: GoogleFonts.cabin(
              fontSize: 14,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget to build each row in the Key Terms section
  Widget _buildKeyTermRow(String key, String value) {
    // Replaces underscores with spaces for better readability (e.g., "Loan_Amount" -> "Loan Amount")
    final formattedKey = key.replaceAll('_', ' ');

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            formattedKey,
            style: GoogleFonts.cabin(fontSize: 16, color: Colors.grey.shade400),
          ),
          const SizedBox(width: 60),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: GoogleFonts.cabin(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Extracting data from the map
    final risk = data?["Risk_Assessment"] as Map<String, dynamic>? ?? {};
    final keyTerms = data?["Key_Terms"] as Map<String, dynamic>? ?? {};

    return Column(
      children: [
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
              const SizedBox(height: 16),
              // Overall Risk
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Overall Risk",
                    style: GoogleFonts.cabin(
                      fontSize: 16,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  _buildStatusTag(risk['Overall_Risk']),
                ],
              ),
              const SizedBox(height: 12),
              // Confidence
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Confidence",
                    style: GoogleFonts.cabin(
                      fontSize: 16,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  _buildStatusTag(risk['Confidence']),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Key Terms Section
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
                "Key Terms",
                style: GoogleFonts.cabin(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Dynamically creating rows from the keyTerms map
              ...keyTerms.entries.map((entry) {
                return _buildKeyTermRow(entry.key, entry.value.toString());
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }
}
