// File: info_pages.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leagese/colors.dart';

// Privacy Policy & Terms of Service Page
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Stack(
        children: [
          _topgradient(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  _nav(context, "Privacy Policy & Terms"),
                  const SizedBox(height: 20),

                  // Privacy Policy Section
                  _buildInfoContainer(
                    "Privacy Policy",
                    """We respect your privacy and are committed to protecting your personal information. This privacy policy explains how we collect, use, and share information about you when you use our legal services app.

Information We Collect:
• Personal information (name, email, phone number)
• Document data and legal information you upload
• Usage data and app analytics
• Device information and IP address

How We Use Your Information:
• To provide legal document analysis services
• To improve our AI legal assistant functionality
• To communicate with you about your account
• To ensure app security and prevent fraud

Data Sharing:
• We do not sell your personal information
• We may share anonymized data for research
• We work with trusted service providers
• Legal compliance when required by law

Your Rights:
• Access and update your personal information
• Delete your account and associated data
• Opt-out of marketing communications
• Request data portability

Data Security:
• End-to-end encryption for sensitive documents
• Secure cloud storage with industry standards
• Regular security audits and updates
• Limited access on need-to-know basis""",
                  ),

                  const SizedBox(height: 20),

                  // Terms of Service Section
                  _buildInfoContainer(
                    "Terms of Service",
                    """By using Legease, you agree to these terms of service. Please read them carefully.

Acceptance of Terms:
• You must be 18+ years old to use our services
• You agree to use the app lawfully and responsibly
• These terms may be updated periodically

Service Description:
• AI-powered legal document analysis
• Legal information and guidance
• Lawyer consultation platform
• Document management tools

User Responsibilities:
• Provide accurate information
• Keep your account credentials secure
• Use services for lawful purposes only
• Respect intellectual property rights

Limitations:
• Our service is for informational purposes
• Not a substitute for professional legal advice
• We are not liable for legal decisions based on our analysis
• Service availability may vary

Termination:
• You may terminate your account anytime
• We may suspend accounts for violations
• Upon termination, some data may be retained
• Certain obligations survive termination

Intellectual Property:
• You retain rights to your uploaded documents
• We have rights to improve our services
• Respect third-party intellectual property
• Report any copyright violations""",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topgradient() {
    return Container(
      height: 200,
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

// Data Management Page
class DataManagementPage extends StatelessWidget {
  const DataManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Stack(
        children: [
          _topgradient(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  _nav(context, "Data Management"),
                  const SizedBox(height: 20),

                  _buildInfoContainer(
                    "Your Data Rights",
                    """You have complete control over your personal data and legal documents stored in our system.

Data Access:
• View all personal information we have about you
• Download your data in portable formats
• Request detailed activity logs
• Access document upload history

Data Correction:
• Update personal profile information
• Modify document metadata and tags
• Correct any inaccuracies in your data
• Update communication preferences

Data Deletion:
• Delete individual documents anytime
• Remove personal information from profile
• Request complete account deletion
• Automatic deletion after account closure

Data Portability:
• Export documents in original formats
• Download analysis reports as PDF
• Transfer data to other legal platforms
• Backup your legal document library""",
                  ),

                  const SizedBox(height: 20),

                  _buildInfoContainer(
                    "Storage & Security",
                    """Your legal documents are stored securely using enterprise-grade security measures.

Storage Infrastructure:
• Cloud storage with 99.9% uptime guarantee
• Automatic backups and redundancy
• Geographic distribution for reliability
• Scalable storage for growing needs

Security Measures:
• AES-256 encryption at rest
• TLS 1.3 encryption in transit
• Regular penetration testing
• SOC 2 Type II compliance

Access Controls:
• Multi-factor authentication
• Role-based access permissions
• Activity logging and monitoring
• Automatic session timeouts

Data Retention:
• Active documents stored indefinitely
• Deleted items recoverable for 30 days
• Complete deletion after retention period
• Legal compliance retention periods""",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topgradient() {
    return Container(
      height: 200,
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

// FAQ Page
class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Stack(
        children: [
          _topgradient(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  _nav(context, "Frequently Asked Questions"),
                  const SizedBox(height: 20),

                  _buildFAQItem(
                    "What is Legease?",
                    "Legease is an AI-powered legal document analysis platform that helps you understand complex legal documents, contracts, and agreements. Our intelligent system provides risk assessment, clause analysis, and plain-english explanations.",
                  ),

                  _buildFAQItem(
                    "How accurate is the AI analysis?",
                    "Our AI system is trained on millions of legal documents and achieves 95%+ accuracy in document analysis. However, our service should complement, not replace, professional legal advice for important decisions.",
                  ),

                  _buildFAQItem(
                    "What types of documents can I upload?",
                    "You can upload contracts, agreements, leases, terms of service, privacy policies, NDAs, employment agreements, and most legal documents in PDF, DOC, or image formats.",
                  ),

                  _buildFAQItem(
                    "Is my data secure?",
                    "Yes, we use enterprise-grade security including AES-256 encryption, secure cloud storage, and comply with industry standards. Your documents are private and confidential.",
                  ),

                  _buildFAQItem(
                    "Can I consult with real lawyers?",
                    "Yes, our platform connects you with verified legal professionals for consultation. You can chat, schedule calls, or book in-person meetings through the app.",
                  ),

                  _buildFAQItem(
                    "How much does Legease cost?",
                    "We offer a free tier with basic document analysis. Premium subscriptions start at ₹999/month with unlimited analysis, priority support, and lawyer consultations.",
                  ),

                  _buildFAQItem(
                    "Can I use Legease for business contracts?",
                    "Absolutely! Legease is designed for both personal and business use. We have specialized analysis for various contract types including vendor agreements, employment contracts, and partnership deals.",
                  ),

                  _buildFAQItem(
                    "What languages does Legease support?",
                    "Currently, we support documents in English and Hindi. We're working on adding more Indian regional languages in future updates.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Container(
      width: double.infinity,
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
          Text(
            question,
            style: GoogleFonts.cabin(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            answer,
            style: GoogleFonts.cabin(
              fontSize: 14,
              color: Colors.grey.shade400,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _topgradient() {
    return Container(
      height: 200,
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

// Contact Page
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Stack(
        children: [
          _topgradient(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  _nav(context, "Contact Support"),
                  const SizedBox(height: 20),

                  _buildInfoContainer(
                    "Get in Touch",
                    """We're here to help! Contact our support team for any questions, issues, or feedback about Legease.

Support Hours:
• Monday to Friday: 9:00 AM - 8:00 PM IST
• Saturday: 10:00 AM - 6:00 PM IST
• Sunday: Emergency support only
• Response time: Within 2-4 hours

Contact Methods:
• Email: support@legease.com
• Phone: +91-9876543210 (India)
• WhatsApp: +91-9876543210
• Live Chat: Available in app (Premium users)

Office Address:
Legease Technologies Pvt Ltd
123 Legal Tower, Sector 62
Noida, Uttar Pradesh - 201301
India

Emergency Support:
For urgent legal matters requiring immediate assistance, contact our 24/7 emergency helpline at +91-9876543211""",
                  ),

                  const SizedBox(height: 20),

                  _buildContactOption(
                    Iconsax.message,
                    "Email Support",
                    "support@legease.com",
                    "Send us detailed queries",
                    () {
                      // Handle email contact
                    },
                  ),

                  _buildContactOption(
                    Iconsax.call,
                    "Phone Support",
                    "+91-9876543210",
                    "Call for immediate assistance",
                    () {
                      // Handle phone call
                    },
                  ),

                  _buildContactOption(
                    Iconsax.message_text,
                    "Live Chat",
                    "Available for Premium users",
                    "Chat with support agents",
                    () {
                      // Handle live chat
                    },
                  ),

                  _buildContactOption(
                    Iconsax.location,
                    "Office Visit",
                    "Noida, UP - 201301",
                    "Schedule an in-person meeting",
                    () {
                      // Handle office visit
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactOption(
    IconData icon,
    String title,
    String subtitle,
    String description,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
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
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: MyColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(icon, color: MyColors.primary, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.cabin(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.cabin(
                      fontSize: 14,
                      color: MyColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    description,
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

  Widget _topgradient() {
    return Container(
      height: 200,
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

// Feedback Page
class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _feedbackController = TextEditingController();
  String _selectedCategory = "General";
  int _rating = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Stack(
        children: [
          _topgradient(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  _nav(context, "Send Feedback"),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "We Value Your Feedback",
                          style: GoogleFonts.cabin(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Help us improve Legease by sharing your thoughts and suggestions.",
                          style: GoogleFonts.cabin(
                            fontSize: 14,
                            color: Colors.grey.shade400,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Rating Section
                        Text(
                          "Overall Rating",
                          style: GoogleFonts.cabin(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: List.generate(5, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _rating = index + 1;
                                });
                              },
                              child: Icon(
                                index < _rating ? Iconsax.star1 : Iconsax.star,
                                color: index < _rating
                                    ? Colors.amber
                                    : Colors.grey.shade600,
                                size: 28,
                              ),
                            );
                          }),
                        ),

                        const SizedBox(height: 24),

                        // Category Selection
                        Text(
                          "Feedback Category",
                          style: GoogleFonts.cabin(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          children:
                              [
                                    "General",
                                    "Bug Report",
                                    "Feature Request",
                                    "UI/UX",
                                    "Performance",
                                  ]
                                  .map(
                                    (category) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedCategory = category;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: _selectedCategory == category
                                              ? MyColors.primary.withOpacity(
                                                  0.3,
                                                )
                                              : Colors.grey.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: Border.all(
                                            color: _selectedCategory == category
                                                ? MyColors.primary
                                                : Colors.grey.shade600,
                                          ),
                                        ),
                                        child: Text(
                                          category,
                                          style: GoogleFonts.cabin(
                                            fontSize: 12,
                                            color: _selectedCategory == category
                                                ? MyColors.primary
                                                : Colors.grey.shade400,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                        ),

                        const SizedBox(height: 24),

                        // Feedback Text
                        Text(
                          "Your Feedback",
                          style: GoogleFonts.cabin(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade600),
                          ),
                          child: TextField(
                            controller: _feedbackController,
                            maxLines: 6,
                            style: GoogleFonts.cabin(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              hintText:
                                  "Please share your detailed feedback, suggestions, or report any issues...",
                              hintStyle: GoogleFonts.cabin(
                                color: Colors.grey.shade500,
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Submit Button
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: MyColors.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            onPressed: _submitFeedback,
                            child: Text(
                              "Submit Feedback",
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitFeedback() {
    if (_feedbackController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Please enter your feedback",
            style: GoogleFonts.cabin(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Handle feedback submission
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Thank you for your feedback! We'll review it soon.",
          style: GoogleFonts.cabin(color: Colors.white),
        ),
        backgroundColor: MyColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    _feedbackController.clear();
    setState(() {
      _selectedCategory = "General";
      _rating = 5;
    });
  }

  Widget _topgradient() {
    return Container(
      height: 200,
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

// Shared Widgets
Widget _nav(BuildContext context, String title) {
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
      Expanded(
        child: Text(
          title,
          style: GoogleFonts.cabin(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

Widget _buildInfoContainer(String title, String content) {
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
          title,
          style: GoogleFonts.cabin(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          content,
          style: GoogleFonts.cabin(
            fontSize: 14,
            color: Colors.grey.shade400,
            height: 1.6,
          ),
        ),
      ],
    ),
  );
}
