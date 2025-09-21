import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leagese/Pages/MainPages/Document%20Info/docinfo.dart';
import 'package:leagese/colors.dart';
import 'package:leagese/models/lawyer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DocumentHistoryPage extends StatefulWidget {
  const DocumentHistoryPage({super.key});

  @override
  State<DocumentHistoryPage> createState() => _DocumentHistoryPageState();
}

class _DocumentHistoryPageState extends State<DocumentHistoryPage> {
  String selectedFilter = "All";
  final List<DocumentHistory> documents = [
    DocumentHistory(
      title: "Employee Agreement",
      type: "Employment Agreement",
      fileName: "emp.pdf",
      datafile: "assets/img/employement.json",
      lawyer: lawyers[2], // Business Lawyer
      pages: 7,
    ),
    DocumentHistory(
      title: "Loan Agreement",
      type: "Loan Agreement",
      fileName: "loan.pdf",
      lawyer: lawyers[6],
      datafile: "assets/img/loan.json", // Tax Lawyer
      pages: 26,
    ),
    DocumentHistory(
      title: "Rent Agreement",
      type: "Rent Agreement",
      fileName: "rent.pdf",
      lawyer: lawyers[1],
      datafile: "assets/img/rent.json", // Tax Lawyer
      pages: 26,
    ),
  ];
  void openPdfPopup(String pdfAssetPath, String name) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.all(16),
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height:
                MediaQuery.of(context).size.height *
                0.7, // 70% of screen height
            color: MyColors.primary,
            child: Column(
              children: [
                // Custom AppBar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  height: 56,
                  color: MyColors.primary,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Iconsax.close_circle,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      Expanded(
                        child: Text(
                          name,
                          style: GoogleFonts.cabin(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(width: 48), // To balance the leading icon
                    ],
                  ),
                ),
                // PDF Viewer
                Expanded(
                  child: SfPdfViewer.asset(
                    pdfAssetPath,
                    canShowScrollHead: true,
                    canShowScrollStatus: true,
                    enableDoubleTapZooming: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
                // Navigation Header
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: nav(context),
                ),

                // Filter Chips
                // const SizedBox(height: 12),

                // Stats Overview
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 12),
                //   child: Container(
                //     padding: const EdgeInsets.all(16),
                //     decoration: BoxDecoration(
                //       color: Colors.grey.withOpacity(0.1),
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //         _buildStatItem(
                //           "Total Documents",
                //           "${documents.length}",
                //           Iconsax.document,
                //         ),
                //         _buildStatItem("High Risk", "1", Iconsax.danger),
                //         _buildStatItem("This Month", "3", Iconsax.calendar),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(height: 16),

                // Document List
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      final document = documents[index];
                      return _buildDocumentCard(document);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: MyColors.primary.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, color: MyColors.textPrimary, size: 20),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.cabin(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.cabin(fontSize: 12, color: Colors.grey.shade400),
        ),
      ],
    );
  }

  Widget _buildDocumentCard(DocumentHistory document) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
          // Document Header
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Iconsax.document_text,
                  color: Colors.grey.shade400,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      document.title,
                      style: GoogleFonts.cabin(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      document.type,
                      style: GoogleFonts.cabin(
                        fontSize: 12,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Document Details
          Row(
            children: [
              _buildDetailItem(
                Iconsax.document_text,
                "${document.pages} pages",
              ),
              _buildDetailItem(
                Iconsax.calendar,
                _formatDate(document.uploadDate),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Lawyer Details Section
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // Lawyer Avatar
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        MyColors.primary.withOpacity(0.8),
                        MyColors.primary,
                      ],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      document.lawyer.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Lawyer Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        document.lawyer.name,
                        style: GoogleFonts.cabin(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        document.lawyer.type,
                        style: GoogleFonts.cabin(
                          fontSize: 11,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                // Rating
                Row(
                  children: [
                    Icon(Iconsax.star1, color: Colors.amber, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      document.lawyer.accuracyRate,
                      style: GoogleFonts.cabin(
                        fontSize: 12,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
          // Action Buttons Row
          Row(
            children: [
              // View Agreement Button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    openPdfPopup(
                      'assets/img/${document.fileName}',
                      document.title,
                    );
                    // Navigate to agreement page
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => AgreementPage(document: document),
                    //   ),
                    // );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: MyColors.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: MyColors.primary),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Iconsax.document_text,
                          color: MyColors.textPrimary,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "View Agreement",
                          style: GoogleFonts.cabin(
                            color: MyColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // View Details Button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Navigate to document details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DocInfoPage(
                          lawyer: document.lawyer,
                          jsonFileName: document.datafile,
                          filename: document.title,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: MyColors.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: MyColors.primary),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Iconsax.eye,
                          color: MyColors.textPrimary,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "View Details",
                          style: GoogleFonts.cabin(
                            color: MyColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.grey.shade400, size: 14),
        const SizedBox(width: 4),
        Text(
          text,
          style: GoogleFonts.cabin(fontSize: 12, color: Colors.grey.shade400),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0) return "Today";
    if (difference == 1) return "Yesterday";
    if (difference < 7) return "${difference}d ago";
    return "${date.day}/${date.month}/${date.year}";
  }

  Widget topgradient() {
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
        // GestureDetector(
        //   onTap: () => Navigator.pop(context),
        //   child: Container(
        //     height: 35,
        //     width: 35,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(50),
        //       color: MyColors.textPrimary.withOpacity(0.28),
        //     ),
        //     child: const Icon(
        //       Iconsax.arrow_left_2,
        //       color: Colors.white,
        //       size: 20,
        //     ),
        //   ),
        // ),
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
        // Container(
        //   height: 35,
        //   width: 35,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(50),
        //     color: MyColors.textPrimary.withOpacity(0.28),
        //   ),
        //   child: const Icon(
        //     Iconsax.search_normal,
        //     color: Colors.white,
        //     size: 20,
        //   ),
        // ),
      ],
    );
  }
}

class DocumentHistory {
  final String title;
  final String type;
  final Lawyer lawyer;
  final String datafile;
  final String fileName;
  final DateTime uploadDate = DateTime.now().subtract(const Duration(days: 3));
  final int pages;

  DocumentHistory({
    required this.title,
    required this.type,
    required this.lawyer,
    required this.fileName,
    required this.pages,
    required this.datafile,
  });
}
