import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leagese/Pages/MainPages/HistoryPage/history.dart';
import 'package:leagese/Pages/MainPages/Home/FileUploadPage.dart';
import 'package:leagese/Pages/MainPages/Home/fullpagefile.dart';
import 'package:leagese/Pages/MainPages/Home/homepage.dart';
import 'package:leagese/Pages/MainPages/Home/ipc.dart';
import 'package:leagese/Pages/MainPages/Lobot/chatbot_general.dart';
import 'package:leagese/Pages/MainPages/Profile/profile.dart';
import 'package:leagese/Pages/Onboard/screen1.dart';
import 'package:leagese/colors.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:leagese/models/lawyer.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> pages = [
    HomePage(),
    DocumentHistoryPage(), // Placeholder for SearchPage
    AILegalAssistant(), // Placeholder for ProfilePage
    ProfilePage(), // Placeholder for ProfilePage
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Stack(
        children: [
          // Top gradient background for all pages
          topgradient(),
          IndexedStack(index: selectedIndex, children: pages),
          // Top navigation overlay
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: nav(selectedIndex),
            ),
          ),
        ],
      ),

      // Curved Navigation Bar with labels
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: CurvedNavigationBar(
            animationDuration: Duration(milliseconds: 400),
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
                  // Use 'child' instead of 'icon'
                  Iconsax.home,
                  size: 28,
                  color: selectedIndex == 0
                      ? MyColors.textPrimary
                      : const Color(0xFF6B7280),
                ),
                label: "Home",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: selectedIndex == 0
                      ? MyColors.textPrimary
                      : Colors.grey.shade600,
                ),
              ),
              CurvedNavigationBarItem(
                child: Icon(
                  // Use 'child' instead of 'icon'
                  Iconsax.archive,
                  size: 28,
                  color: selectedIndex == 1
                      ? MyColors.textPrimary
                      : const Color(0xFF6B7280),
                ),
                label: "History",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: selectedIndex == 1
                      ? MyColors.textPrimary
                      : Colors.grey.shade600,
                ),
              ),
              CurvedNavigationBarItem(
                child: Icon(
                  Icons.android,
                  size: 28,
                  color: selectedIndex == 2
                      ? MyColors.textPrimary
                      : const Color(0xFF6B7280),
                ),
                label: "Lobot",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: selectedIndex == 2
                      ? MyColors.textPrimary
                      : Colors.grey.shade600,
                ),
              ),
              CurvedNavigationBarItem(
                child: Icon(
                  Iconsax.user,
                  size: 28,
                  color: selectedIndex == 3
                      ? MyColors.textPrimary
                      : const Color(0xFF6B7280),
                ),
                label: "Profile",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: selectedIndex == 3
                      ? MyColors.textPrimary
                      : Colors.grey.shade600,
                ),
              ),
            ],

            // Remove buttonLabelColor - not a valid property
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

  Row nav(int selectedIndex) {
    return Row(
      children: [
        Image.asset("assets/img/top.png", height: 32),
        const SizedBox(width: 20),
        Text(
          selectedIndex == 3
              ? "Profile & Settings"
              : selectedIndex == 2
              ? "Lobot"
              : selectedIndex == 1
              ? "Legease History"
              : "Legease",
          style: GoogleFonts.cabin(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            _showAIAssistantQuickMenu(context);
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: MyColors.textPrimary.withOpacity(0.28),
            ),
            child: const Icon(
              Iconsax.message_programming, // AI Assistant icon
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
        const SizedBox(width: 10),

        // Notifications with Badge
        GestureDetector(
          onTap: () {
            _showNotificationPanel(context);
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: MyColors.textPrimary.withOpacity(0.28),
            ),
            child: Stack(
              children: [
                const Center(
                  child: Icon(
                    Iconsax.notification,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                // Notification badge
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// AI Assistant Quick Menu Function
void _showAIAssistantQuickMenu(BuildContext context) {
  Lawyer sachin = Lawyer(
    name: "General",
    type: "General Lawyer",
    image: "assets/img/1.png",
    description: "General legal assistance and inquiries.",
    analysisSpeed: "N/A",
    accuracyRate: "N/A",
    documentsProcessed: 0,
  );
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "AI Legal Assistant",
              style: GoogleFonts.cabin(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // Quick AI Options
            _buildQuickAIOption(
              Iconsax.document_text,
              "Analyze Document",
              "Upload and analyze new legal document",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FileUploadPage(lawyer: sachin),
                  ),
                );
              },
            ),

            _buildQuickAIOption(
              Iconsax.search_normal,
              "IPC Sections",
              "Find specific legal sections quickly",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IPCSectionPage()),
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}

// Notification Panel Function
void _showNotificationPanel(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    isDismissible: true, // Add this
    enableDrag: true, // Add this
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                // Handle bar
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                // Header
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Notifications",
                        style: GoogleFonts.cabin(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Mark all as read
                        },
                        child: Text(
                          "Mark all read",
                          style: GoogleFonts.cabin(
                            color: MyColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Notifications List
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      _buildNotificationItem(
                        Iconsax.document_text,
                        "Document Analysis Complete",
                        "Your rental agreement analysis is ready",
                        "2 minutes ago",
                        true,
                      ),
                      _buildNotificationItem(
                        Iconsax.message,
                        "New Message from Lawyer",
                        "Adv. Rajesh Kumar sent you a message",
                        "1 hour ago",
                        true,
                      ),
                      _buildNotificationItem(
                        Iconsax.security,
                        "Security Alert",
                        "Login detected from new device",
                        "3 hours ago",
                        false,
                      ),
                      _buildNotificationItem(
                        Iconsax.calendar,
                        "Consultation Reminder",
                        "Your appointment is tomorrow at 3 PM",
                        "1 day ago",
                        false,
                      ),
                      _buildNotificationItem(
                        Iconsax.star,
                        "Premium Feature Unlocked",
                        "You now have access to advanced AI analysis",
                        "2 days ago",
                        false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

// Helper Widgets
Widget _buildQuickAIOption(
  IconData icon,
  String title,
  String subtitle,
  VoidCallback onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(bottom: 12, left: 20, right: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: MyColors.primary.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: MyColors.textPrimary, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.cabin(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.cabin(
                    fontSize: 12,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
          Icon(Iconsax.arrow_right_3, color: Colors.grey.shade600, size: 16),
        ],
      ),
    ),
  );
}

Widget _buildNotificationItem(
  IconData icon,
  String title,
  String message,
  String time,
  bool isUnread,
) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: isUnread
          ? MyColors.primary.withOpacity(0.1)
          : Colors.grey.withOpacity(0.05),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: isUnread
            ? MyColors.primary.withOpacity(0.3)
            : Colors.grey.withOpacity(0.2),
      ),
    ),
    child: Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: MyColors.primary.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, color: MyColors.textPrimary, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.cabin(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (isUnread)
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: MyColors.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                message,
                style: GoogleFonts.cabin(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: GoogleFonts.cabin(
                  fontSize: 10,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
