import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leagese/Pages/MainPages/Profile/extrapages.dart';
import 'package:leagese/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool notificationsEnabled = true;
  bool twoFactorEnabled = true;
  bool dataConsentEnabled = false;
  bool jurisdictionDetectionEnabled = true;
  bool anonymousContributionEnabled = false;

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
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: nav(context),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        // Navigation Header
                        const SizedBox(height: 20),

                        // Profile Section
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              // Profile Image
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(
                                    colors: [
                                      MyColors.primary.withOpacity(0.8),
                                      MyColors.primary,
                                    ],
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    "assets/img/sad.png", // Use sachin.png
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Name
                              Text(
                                "Sachin Sharma",
                                style: GoogleFonts.cabin(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Email
                              Text(
                                "sachinsharmaaofficial@gmail.com",
                                style: GoogleFonts.cabin(
                                  fontSize: 14,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Account Section
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ACCOUNT",
                                style: GoogleFonts.cabin(
                                  fontSize: 12,
                                  color: MyColors.primary,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Membership
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Membership",
                                        style: GoogleFonts.cabin(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Active",
                                        style: GoogleFonts.cabin(
                                          fontSize: 12,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: MyColors.primary.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      "Premium",
                                      style: GoogleFonts.cabin(
                                        fontSize: 12,
                                        color: MyColors.textPrimary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),

                              const SizedBox(height: 16),

                              // Two-Factor Authentication
                              _buildSettingsItem(
                                "Two-Factor Authentication",
                                "Enabled",
                                null,
                                trailing: Switch(
                                  value: twoFactorEnabled,
                                  onChanged: (value) {
                                    setState(() {
                                      twoFactorEnabled = value;
                                    });
                                  },
                                  activeColor: MyColors.primary,
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Connected Accounts
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // App Preferences Section
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "APP PREFERENCES",
                                style: GoogleFonts.cabin(
                                  fontSize: 12,
                                  color: MyColors.primary,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Notification Settings
                              _buildSettingsItem(
                                "Notification Settings",
                                "Enabled",
                                null,
                                trailing: Switch(
                                  value: notificationsEnabled,
                                  onChanged: (value) {
                                    setState(() {
                                      notificationsEnabled = value;
                                    });
                                  },
                                  activeColor: MyColors.primary,
                                ),
                              ),

                              const SizedBox(height: 16),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Data & Privacy Section
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "DATA & PRIVACY",
                                style: GoogleFonts.cabin(
                                  fontSize: 12,
                                  color: MyColors.primary,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Data Consent
                              _buildSettingsItem(
                                "Data Consent",
                                "Allow us to use your data to improve our services",
                                null,
                                trailing: Switch(
                                  value: dataConsentEnabled,
                                  onChanged: (value) {
                                    setState(() {
                                      dataConsentEnabled = value;
                                    });
                                  },
                                  activeColor: MyColors.primary,
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Jurisdiction Detection
                              _buildSettingsItem(
                                "Jurisdiction Detection",
                                "Automatically detect the jurisdiction of your documents",
                                null,
                                trailing: Switch(
                                  value: jurisdictionDetectionEnabled,
                                  onChanged: (value) {
                                    setState(() {
                                      jurisdictionDetectionEnabled = value;
                                    });
                                  },
                                  activeColor: MyColors.primary,
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Anonymous Clause Contribution
                              _buildSettingsItem(
                                "Anonymous Clause Contribution",
                                "Contribute anonymous clauses to our database",
                                null,
                                trailing: Switch(
                                  value: anonymousContributionEnabled,
                                  onChanged: (value) {
                                    setState(() {
                                      anonymousContributionEnabled = value;
                                    });
                                  },
                                  activeColor: MyColors.primary,
                                ),
                              ),

                              const SizedBox(height: 20),

                              // Legal Disclaimer
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Legal Disclaimer",
                                      style: GoogleFonts.cabin(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "By using this app, you agree to our Terms of Service and Privacy Policy. Please review these documents carefully to understand your rights and obligations. If you have any questions, please contact our support team.",
                                      style: GoogleFonts.cabin(
                                        fontSize: 12,
                                        color: Colors.grey.shade400,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Legal & Privacy Section
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "LEGAL & PRIVACY",
                                style: GoogleFonts.cabin(
                                  fontSize: 12,
                                  color: MyColors.primary,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Privacy Policy & Terms of Service
                              _buildSettingsItem(
                                "Privacy Policy & Terms of Service",
                                null,
                                Iconsax.arrow_right_3,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PrivacyPolicyPage(),
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(height: 16),

                              // Data Management
                              _buildSettingsItem(
                                "Data Management",
                                null,
                                Iconsax.arrow_right_3,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DataManagementPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Support & Feedback Section
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "SUPPORT & FEEDBACK",
                                style: GoogleFonts.cabin(
                                  fontSize: 12,
                                  color: MyColors.primary,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // FAQ/Help Center
                              GestureDetector(
                                child: _buildSettingsItem(
                                  "FAQ/Help Center",
                                  null,
                                  Iconsax.arrow_right_3,
                                  onTap: () {
                                    // Navigate to file upload page
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FAQPage(),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Contact Support
                              GestureDetector(
                                child: _buildSettingsItem(
                                  "Contact Support",
                                  null,
                                  Iconsax.arrow_right_3,
                                  onTap: () {
                                    // Navigate to file upload page
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ContactPage(),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Send Feedback
                              GestureDetector(
                                child: _buildSettingsItem(
                                  "Send Feedback",
                                  null,
                                  Iconsax.arrow_right_3,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FeedbackPage(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Log Out Button
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            onPressed: () {
                              _showLogoutDialog();
                            },
                            child: Text(
                              "Log Out",
                              style: GoogleFonts.cabin(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildSettingsItem(
    String title,
    String? subtitle,
    IconData? trailingIcon, {
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.cabin(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.cabin(
                      fontSize: 12,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) trailing,
          if (trailingIcon != null)
            Icon(trailingIcon, color: Colors.grey.shade600, size: 16),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            "Log Out",
            style: GoogleFonts.cabin(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Are you sure you want to log out of your account?",
            style: GoogleFonts.cabin(color: Colors.grey.shade400),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: GoogleFonts.cabin(color: Colors.grey.shade400),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Handle logout
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Logged out successfully",
                      style: GoogleFonts.cabin(color: Colors.white),
                    ),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
              child: Text(
                "Log Out",
                style: GoogleFonts.cabin(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
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
      ],
    );
  }
}
