import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leagese/colors.dart';
import 'package:leagese/models/lawyer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package.iconsax/iconsax.dart';
import 'package:leagese/colors.dart';
import 'package:leagese/models/lawyer.dart';

class SummaryPage extends StatefulWidget {
  final Lawyer lawyer;
  final Map<String, dynamic>? data;
  final Map<String, dynamic>? clauses;

  const SummaryPage({super.key, required this.lawyer, this.data, this.clauses});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // ADDED: Predefined color palette that will repeat for the clauses.
  final List<Color> _colorPalette = [
    Colors.cyan,
    Colors.green,
    Colors.red,
    Colors.amber,
    Colors.orange,
    Colors.purple,
    Colors.indigo,
    Colors.teal,
    Colors.deepPurple,
    Colors.brown,
    Colors.pink,
    Colors.grey,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final intro = widget.data!["intro"];
    final medium = widget.data!["medium"];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            nav(context),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: MyColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelStyle: GoogleFonts.cabin(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: GoogleFonts.cabin(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey.shade400,
                tabs: const [
                  Tab(text: "TL;DR"),
                  Tab(text: "Medium"),
                  Tab(text: "Clauses"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTLDRContent(intro),
                  _buildMediumContent(medium),
                  _buildClauseByClauseContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTLDRContent(dynamic intro) {
    // This function remains unchanged
    return SingleChildScrollView(
      child: Column(
        children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TL;DR",
                      style: GoogleFonts.cabin(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  intro["Short_Summary"] ??
                      "This agreement outlines the terms and conditions for a software license. It grants the licensee a non-exclusive right to use the software for a specified period. Key clauses include payment terms, intellectual property rights, and termination conditions.",
                  style: GoogleFonts.cabin(
                    fontSize: 14,
                    color: Colors.grey.shade400,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildKeyClausesSection(intro),
        ],
      ),
    );
  }

  Widget _buildKeyClausesSection(dynamic intro) {
    // This function remains unchanged
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
          Text(
            "Key Clauses",
            style: GoogleFonts.cabin(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          _buildClauseItem(
            "Payment Terms",
            intro["Payment_Terms"] ??
                "The licensee shall pay the licensor a fee of \$5,000 within 30 days of signing this agreement.",
            Colors.transparent,
            "",
          ),
          const SizedBox(height: 20),
          _buildClauseItem(
            "Intellectual Property",
            intro["Intellectual_Property"] ??
                "The licensor retains all intellectual property rights to the software and may not modify, distribute, or reverse engineer it.",
            Colors.transparent,
            "",
          ),
        ],
      ),
    );
  }

  Widget _buildMediumContent(dynamic medium) {
    // This function remains unchanged
    return SingleChildScrollView(
      child: Column(
        children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Medium Summary",
                      style: GoogleFonts.cabin(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  medium["Medium_Summary"] ??
                      "This software license agreement establishes a comprehensive framework for the legal use of proprietary software. The document specifies the rights and obligations of both parties, including detailed payment schedules, usage restrictions, and compliance requirements. The agreement includes provisions for intellectual property protection, liability limitations, and termination procedures. Additionally, it outlines support services, update policies, and dispute resolution mechanisms to ensure smooth operation throughout the license period.",
                  style: GoogleFonts.cabin(
                    fontSize: 14,
                    color: Colors.grey.shade400,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildDetailedClausesSection(medium),
        ],
      ),
    );
  }

  Widget _buildClauseByClauseContent() {
    // This function remains unchanged
    return SingleChildScrollView(
      child: Column(
        children: [
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
                  "Detailed Analysis",
                  style: GoogleFonts.cabin(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Complete clause-by-clause breakdown with legal implications and recommendations.",
                  style: GoogleFonts.cabin(
                    fontSize: 14,
                    color: Colors.grey.shade400,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildAllClausesSection(),
        ],
      ),
    );
  }

  // MODIFIED: This function now assigns a color from the palette to each clause.
  Widget _buildAllClausesSection() {
    final clauses = widget.clauses!;

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
          Text(
            "Complete Analysis",
            style: GoogleFonts.cabin(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Tap on any clause to view detailed legal analysis, implications, and recommendations.",
            style: GoogleFonts.cabin(
              fontSize: 14,
              color: Colors.grey.shade400,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          ...clauses.entries.toList().asMap().entries.map((indexedEntry) {
            int index = indexedEntry.key;
            MapEntry<String, dynamic> entry = indexedEntry.value;

            final clauseNumber = entry.key;
            final clauseData = entry.value as Map<String, dynamic>;
            final summary =
                clauseData['details/summary'] as String? ??
                'No summary available.';
            // Assign a color from the palette, repeating if necessary.
            final color = _colorPalette[index % _colorPalette.length];

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildClickableClauseItem(
                "Clause $clauseNumber", // Title
                summary, // Description
                clauseData, // Full data for the popup
                color, // Pass the assigned color
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  // MODIFIED: This widget now accepts a Color to style itself.
  Widget _buildClickableClauseItem(
    String title,
    String description,
    Map<String, dynamic> clauseData,
    Color color,
  ) {
    return GestureDetector(
      onTap: () => _showClauseDetailPopup(title, clauseData, color),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.cabin(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Icon(
                  Iconsax.arrow_right_3,
                  size: 16,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: GoogleFonts.cabin(
                fontSize: 14,
                color: Colors.grey.shade400,
                height: 1.5,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              "Tap for detailed analysis →",
              style: GoogleFonts.cabin(
                fontSize: 12,
                color: color.withOpacity(0.8),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // MODIFIED: The layout is changed to have a fixed header and scrollable content.
  void _showClauseDetailPopup(
    String title,
    Map<String, dynamic> clauseData,
    Color color,
  ) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            clipBehavior: Clip.hardEdge, // Helps contain the border radius
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              maxWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF1F1F1F),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
              border: Border.all(color: color.withOpacity(0.3), width: 2),
            ),
            // CHANGED: The main child is now a Column to separate the header and content.
            child: Column(
              children: [
                // Header - This is now a direct child of the Column, so it will not scroll.
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: color.withOpacity(0.1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.cabin(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Iconsax.close_circle,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ADDED: Expanded widget makes the scrollable area fill the remaining space.
                Expanded(
                  // MOVED: SingleChildScrollView now only wraps the content that needs to scroll.
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildPopupSection(
                            "Detailed Description",
                            clauseData['details/summary'] ??
                                "No description available.",
                            Iconsax.document_text,
                          ),
                          const SizedBox(height: 20),
                          _buildPopupSection(
                            "Legal Implications",
                            clauseData['legal_implication'] ??
                                ["No legal implications provided."],
                            Iconsax.warning_2,
                          ),
                          const SizedBox(height: 20),
                          _buildPopupSection(
                            "Recommendations",
                            clauseData['recommendations'] ??
                                ["No recommendations provided."],
                            Iconsax.tick_circle,
                          ),
                          const SizedBox(height: 24),
                          // Action Buttons
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: color,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Close",
                                        style: GoogleFonts.cabin(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: color, width: 2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Flag for Review",
                                      style: GoogleFonts.cabin(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: color,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // MODIFIED: This widget now intelligently handles both String and List<String>.
  Widget _buildPopupSection(String title, dynamic content, IconData icon) {
    Widget contentWidget;

    // Check if the content is a list
    if (content is List) {
      contentWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    '•  ', // Bullet point
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    item.toString(),
                    style: GoogleFonts.cabin(
                      fontSize: 14,
                      color: Colors.grey.shade300,
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      );
    } else {
      // If it's not a list, treat it as a regular string
      contentWidget = Text(
        content.toString(),
        style: GoogleFonts.cabin(
          fontSize: 14,
          color: Colors.grey.shade300,
          height: 1.6,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: MyColors.primary),
            const SizedBox(width: 8),
            Text(
              title,
              style: GoogleFonts.cabin(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity, // Ensure container takes full width
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: MyColors.primary.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: contentWidget, // Use the dynamically created content widget
        ),
      ],
    );
  }

  Widget _buildDetailedClausesSection(dynamic medium) {
    // This function remains unchanged
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
          Text(
            "Detailed Clauses",
            style: GoogleFonts.cabin(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          _buildClauseItem(
            "License Grant",
            medium["Licence_Grant"] ??
                "Subject to the terms and conditions of this Agreement, Licensor hereby grants to Licensee a non-exclusive, non-transferable license to use the Software.",
            Colors.transparent,
            "",
          ),
          const SizedBox(height: 20),
          _buildClauseItem(
            "Usage Restrictions",
            medium["Usage_Restrictions"] ??
                "Licensee may not copy, modify, distribute, sell, or lease any part of the Software or included documentation, nor reverse engineer or attempt to extract source code.",
            Colors.transparent,
            "",
          ),
          const SizedBox(height: 20),
          _buildClauseItem(
            "Support Services",
            medium["Support_Services"] ??
                "Licensor will provide technical support via email during normal business hours for a period of 12 months from the effective date.",
            Colors.transparent,
            "",
          ),
        ],
      ),
    );
  }

  Widget _buildClauseItem(
    String title,
    String description,
    Color confidenceColor,
    String confidence,
  ) {
    // This function remains unchanged
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.cabin(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            if (confidence.isNotEmpty)
              Row(
                children: [
                  Text(
                    confidence,
                    style: GoogleFonts.cabin(
                      fontSize: 12,
                      color: confidenceColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: confidenceColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: GoogleFonts.cabin(
            fontSize: 14,
            color: Colors.grey.shade400,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Row nav(BuildContext context) {
    // This function remains unchanged
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
          "Document Summary",
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
        "Document Summary",
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
