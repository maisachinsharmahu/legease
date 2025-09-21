import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leagese/Pages/MainPages/Document%20Info/docinfo.dart';
import 'package:leagese/Pages/MainPages/Home/fullpagefile.dart';
import 'package:leagese/Pages/Onboard/screen1.dart';
import 'package:leagese/colors.dart';
import 'package:leagese/models/lawyer.dart';

class FileUploadPage extends StatefulWidget {
  final Lawyer lawyer;
  const FileUploadPage({super.key, required this.lawyer});

  @override
  State<FileUploadPage> createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  GlobalKey<FullPageFileState> _fileWidgetKey = GlobalKey<FullPageFileState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Stack(
        children: [
          topgradient(),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    nav(context),
                    SizedBox(height: 50),
                    fullpagefile(key: _fileWidgetKey),
                    SizedBox(height: 100), // Add space for bottom button
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(color: MyColors.background),
          child: GestureDetector(
            onTap: () {
              // Check if file is selected
              final hasFile = _fileWidgetKey.currentState?.platformFile != null;
              if (hasFile) {
                // Handle file submission logic here
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text('Document sent to ${widget.lawyer.name}'),
                //     backgroundColor: MyColors.primary,
                //   ),
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DocInfoPage(
                      lawyer: widget.lawyer,
                      filename: "Agreement",
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please select a document first'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(28),
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
                  "Send Legal Document to ${widget.lawyer.name}",
                  style: GoogleFonts.cabin(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row nav(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Back button
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

        // Text section that wraps
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: GoogleFonts.cabin(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    const TextSpan(text: "Upload Document for Analysis by "),
                  ],
                ),
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.cabin(
                    fontSize: 18,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: widget.lawyer.name),
                    TextSpan(
                      text: "  ( ${widget.lawyer.type} )",
                      style: GoogleFonts.cabin(
                        fontSize: 14,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            ],
          ),
        ),

        // Spacer icons
      ],
    );
  }
}
