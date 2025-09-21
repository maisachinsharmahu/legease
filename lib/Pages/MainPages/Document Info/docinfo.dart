import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leagese/Pages/MainPages/Document%20Info/Overview.dart';
import 'package:leagese/Pages/MainPages/Document%20Info/analusis.dart';
import 'package:leagese/Pages/MainPages/Document%20Info/chatpage.dart';
import 'package:leagese/Pages/MainPages/Document%20Info/review.dart';
import 'package:leagese/Pages/MainPages/Document%20Info/summary.dart';
import 'package:leagese/colors.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:leagese/models/lawyer.dart';

class DocInfoPage extends StatefulWidget {
  final Lawyer lawyer;
  final String? jsonFileName; 
  final String? filename;
  const DocInfoPage({
    super.key,
    required this.lawyer,
    this.filename,
    this.jsonFileName, 
  });

  @override
  State<DocInfoPage> createState() => _DocInfoPageState();
}

class _DocInfoPageState extends State<DocInfoPage> {
  late String jsonPath;
  late String filename;
  Map<String, dynamic>? docData;
  @override
  void initState() {
    super.initState();
    jsonPath = widget.jsonFileName ?? "assets/img/loan.json";
    filename = widget.filename ?? "assets/img/loan.json";
    loadJson();
  }

  Future<void> loadJson() async {
    final String jsonString = await DefaultAssetBundle.of(
      context,
    ).loadString(jsonPath);
    setState(() {
      docData = Map<String, dynamic>.from(json.decode(jsonString));
    });
  }

  int selectedIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<Widget> get pages => [
    OverviewPage(
      lawyer: widget.lawyer,
      data: docData?["overview"],
      name: filename,
    ),
    SummaryPage(
      lawyer: widget.lawyer,
      data: docData?["summary"],
      clauses: docData?["clauses"],
    ),

    AnalysisPage(lawyer: widget.lawyer, data: docData?["Analysis"]),
    ReviewModePage(lawyer: widget.lawyer, data: docData?["Review"]),
    ChatPage(lawyer: widget.lawyer),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Stack(
        children: [
          topgradient(),
          IndexedStack(index: selectedIndex, children: pages),
          SafeArea(child: Padding(padding: const EdgeInsets.all(12.0))),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(),
        child: SafeArea(
          child: CurvedNavigationBar(
            animationDuration: const Duration(milliseconds: 400),
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            buttonBackgroundColor: MyColors.primary,
            color: MyColors.textPrimary.withOpacity(0.08),
            height: 75,
            key: _bottomNavigationKey,
            index: selectedIndex,
            items: [
              CurvedNavigationBarItem(
                child: Icon(
                  Iconsax.document_text,
                  size: 28,
                  color: selectedIndex == 0
                      ? MyColors.textPrimary
                      : const Color(0xFF6B7280),
                ),
                label: "Overview",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: selectedIndex == 0
                      ? MyColors.textPrimary
                      : Colors.grey.shade600,
                ),
              ),
              CurvedNavigationBarItem(
                child: Icon(
                  Iconsax.note_text,
                  size: 28,
                  color: selectedIndex == 1
                      ? MyColors.textPrimary
                      : const Color(0xFF6B7280),
                ),
                label: "Summary",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: selectedIndex == 1
                      ? MyColors.textPrimary
                      : Colors.grey.shade600,
                ),
              ),
              CurvedNavigationBarItem(
                child: Icon(
                  Iconsax.chart_square,
                  size: 28,
                  color: selectedIndex == 2
                      ? MyColors.textPrimary
                      : const Color(0xFF6B7280),
                ),
                label: "Analysis",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: selectedIndex == 2
                      ? MyColors.textPrimary
                      : Colors.grey.shade600,
                ),
              ),
              CurvedNavigationBarItem(
                child: Icon(
                  Iconsax.eye,
                  size: 28,
                  color: selectedIndex == 3
                      ? MyColors.textPrimary
                      : const Color(0xFF6B7280),
                ),
                label: "Review",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: selectedIndex == 3
                      ? MyColors.textPrimary
                      : Colors.grey.shade600,
                ),
              ),
              CurvedNavigationBarItem(
                child: Icon(
                  Iconsax.message_text,
                  size: 28,
                  color: selectedIndex == 4
                      ? MyColors.textPrimary
                      : const Color(0xFF6B7280),
                ),
                label: "Chat",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: selectedIndex == 4
                      ? MyColors.textPrimary
                      : Colors.grey.shade600,
                ),
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            letIndexChange: (index) => true,
          ),
        ),
      ),
    );
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
}
