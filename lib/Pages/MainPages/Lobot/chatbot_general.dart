import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leagese/colors.dart';

class AILegalAssistant extends StatefulWidget {
  const AILegalAssistant({super.key});

  @override
  State<AILegalAssistant> createState() => _AILegalAssistantState();
}

class _AILegalAssistantState extends State<AILegalAssistant>
    with SingleTickerProviderStateMixin {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isBotTyping = false;
  late AnimationController _dotController;

  @override
  void initState() {
    super.initState();
    _dotController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _dotController.dispose();
    super.dispose();
  }

  // Legal responses covering various topics
  final List<String> legalResponses = [
    // IPC Sections
    "According to IPC Section 302, murder is punishable with death or life imprisonment. This covers intentional killing.",
    "IPC Section 354 deals with assault or criminal force to woman with intent to outrage her modesty.",
    "Under IPC Section 420, cheating is punishable with imprisonment up to 7 years and fine.",
    "IPC Section 498A addresses cruelty by husband or relatives of husband towards a married woman.",
    "Section 376 of IPC deals with rape and carries strict punishment including life imprisonment.",
    "IPC Section 506 covers criminal intimidation and punishment for threatening someone.",
    "Under IPC Section 279, negligent driving can lead to imprisonment up to 6 months.",
    "IPC Section 323 deals with voluntarily causing hurt and carries punishment up to 1 year.",

    // Contract Law
    "A valid contract requires offer, acceptance, consideration, and legal capacity of parties.",
    "Breach of contract can result in damages, specific performance, or contract termination.",
    "Force majeure clauses protect parties from liability due to extraordinary circumstances.",
    "Consideration must be something of legal value exchanged between parties.",

    // Constitutional Law
    "Article 14 guarantees equality before law and equal protection of laws.",
    "Article 19 provides six fundamental freedoms including speech and expression.",
    "Article 21 protects life and personal liberty - the most important fundamental right.",
    "Article 32 is the right to constitutional remedies, called 'heart and soul' of Constitution.",

    // Property Law
    "Adverse possession requires continuous, open, and hostile possession for 12 years.",
    "Registration of property is mandatory for transactions above certain value.",
    "Joint ownership can be as tenants in common or joint tenants with different rights.",

    // Family Law
    "Mutual consent divorce requires 6 months cooling period under Hindu Marriage Act.",
    "Maintenance depends on income, lifestyle, and needs of spouse and children.",
    "Child custody decisions prioritize the best interests of the child.",

    // Corporate Law
    "Companies Act 2013 mandates CSR spending for eligible companies.",
    "Director's duties include care, skill, and fiduciary responsibilities.",
    "Insider trading is prohibited and carries severe penalties.",

    // Labor Law
    "PF is mandatory for establishments with 20+ employees earning up to ₹15,000.",
    "Notice period as per Industrial Disputes Act varies by length of service.",
    "Gratuity is payable after 5 years of continuous service.",

    // Tax Law
    "Income tax slabs change annually as per budget announcements.",
    "GST has multiple slabs: 5%, 12%, 18%, and 28% for different goods/services.",
    "TDS rates vary by type of payment and recipient category.",
  ];

  final List<String> personalizedResponses = [
    "Hello Sachin! I've reviewed your document history and can help with any legal queries.",
    "Based on your previous documents, I notice you deal with contract reviews frequently.",
    "Hi Sachin! I have access to all your uploaded legal documents and case history.",
    "I can help you with IPC sections, contract analysis, or any legal questions you have.",
    "Your recent lease agreement analysis shows good attention to detail, Sachin.",
    "I notice you've been working on several legal documents. How can I assist today?",
    "Hello Sachin! I'm your AI legal assistant with complete knowledge of Indian law.",
    "I can provide instant answers on IPC, CrPC, CPC, and other legal matters.",
  ];

  final List<String> legalQuestions = [
    "Would you like me to explain any specific IPC section?",
    "Do you need help with contract review or drafting?",
    "Should I analyze the legal risks in your current documents?",
    "Would you like information about court procedures?",
    "Do you need guidance on compliance requirements?",
    "Should I explain the legal implications of your question?",
    "Would you like me to draft a legal notice template?",
    "Do you need help understanding your rights in this matter?",
    "Should I provide relevant case law references?",
    "Would you like a detailed legal strategy for your issue?",
  ];

  List<ChatMessage> messages = [
    ChatMessage(
      text:
          "Hello Sachin! I'm your AI Legal Assistant. I have complete knowledge of Indian Penal Code, Contract Law, Constitutional Law, and all your document history. How can I help you today?",
      isFromBot: true,
      timestamp: DateTime.now().subtract(Duration(minutes: 1)),
    ),
  ];

  String _getContextualResponse(String userMessage) {
    final message = userMessage.toLowerCase();

    // IPC Section queries
    if (message.contains('ipc') || message.contains('section')) {
      if (message.contains('302') || message.contains('murder')) {
        return "IPC Section 302 deals with murder. It states that whoever commits murder shall be punished with death or imprisonment for life, and shall also be liable to fine. Murder is defined as intentional killing with knowledge that the act is likely to cause death.";
      }
      if (message.contains('354') || message.contains('modesty')) {
        return "IPC Section 354 covers assault or criminal force to woman with intent to outrage her modesty. Punishment is imprisonment up to 2 years, or fine, or both. Recent amendments have made this section more stringent.";
      }
      if (message.contains('420') || message.contains('cheat')) {
        return "IPC Section 420 deals with cheating and dishonestly inducing delivery of property. Punishment includes imprisonment up to 7 years and fine. This covers fraud, deception, and dishonest misrepresentation.";
      }
      if (message.contains('498a')) {
        return "IPC Section 498A addresses cruelty by husband or relatives towards a married woman. It's a cognizable, non-bailable offense with punishment up to 3 years and fine. This section is often used in dowry harassment cases.";
      }
      return "I can help with any IPC section. Common ones include 302 (murder), 354 (outraging modesty), 420 (cheating), 498A (dowry harassment), 376 (rape), 279 (negligent driving). Which specific section do you need information about?";
    }

    // Contract related queries
    if (message.contains('contract') || message.contains('agreement')) {
      return "For contracts, key elements are: 1) Offer & Acceptance 2) Consideration 3) Legal capacity 4) Free consent 5) Lawful object. I can help review your contracts for enforceability, risks, and compliance. What specific contract issue do you have?";
    }

    // Property law queries
    if (message.contains('property') ||
        message.contains('land') ||
        message.contains('real estate')) {
      return "Property law covers buying, selling, and disputes. Key points: 1) Title verification 2) Registration requirements 3) Stamp duty 4) Adverse possession (12 years) 5) Property rights. I can help with property documentation and legal issues.";
    }

    // Criminal law queries
    if (message.contains('criminal') ||
        message.contains('fir') ||
        message.contains('police')) {
      return "Criminal law involves IPC, CrPC procedures. For FIR: Must be registered for cognizable offenses, copy given to complainant, investigation follows. I can guide you through criminal procedures and your rights.";
    }

    // Constitutional queries
    if (message.contains('constitutional') ||
        message.contains('fundamental right')) {
      return "Fundamental Rights under Articles 12-35: Right to Equality (14-18), Right to Freedom (19-22), Right against Exploitation (23-24), Right to Freedom of Religion (25-28), Cultural Rights (29-30), Right to Constitutional Remedies (32).";
    }

    // Tax law queries
    if (message.contains('tax') ||
        message.contains('gst') ||
        message.contains('income tax')) {
      return "Current tax structure: Income Tax has different slabs for individuals. GST rates: 5%, 12%, 18%, 28%. TDS applicable on various payments. I can help with tax compliance and planning strategies.";
    }

    // Family law queries
    if (message.contains('divorce') ||
        message.contains('marriage') ||
        message.contains('custody')) {
      return "Family law covers marriage, divorce, custody, maintenance. Mutual consent divorce has 6-month cooling period. Custody decisions prioritize child's welfare. Maintenance based on income and needs. Hindu Marriage Act, Special Marriage Act apply.";
    }

    // Personal greetings
    if (message.contains('hello') ||
        message.contains('hi') ||
        message.contains('hey')) {
      return personalizedResponses[DateTime.now().millisecond %
          personalizedResponses.length];
    }

    // Default legal response
    return legalResponses[DateTime.now().millisecond % legalResponses.length];
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

                // Chat Messages
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    itemCount: messages.length + (_isBotTyping ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == messages.length && _isBotTyping) {
                        return _buildTypingIndicator();
                      }
                      return ChatBubble(message: messages[index]);
                    },
                  ),
                ),

                // Quick Action Chips
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildQuickActionChip("IPC Sections", Iconsax.book),
                      _buildQuickActionChip(
                        "Contract Help",
                        Iconsax.document_text,
                      ),
                      _buildQuickActionChip("Property Law", Iconsax.home),
                      _buildQuickActionChip("Tax Queries", Iconsax.money),
                      _buildQuickActionChip("Family Law", Iconsax.people),
                    ],
                  ),
                ),

                // Message Input
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextField(
                            controller: _messageController,
                            style: GoogleFonts.cabin(
                              color: Colors.grey.shade300,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              hintText:
                                  "Ask about IPC, contracts, legal issues...",
                              hintStyle: GoogleFonts.cabin(
                                color: Colors.grey.shade500,
                                fontSize: 16,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                            ),
                            maxLines: null,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {
                          if (_messageController.text.trim().isNotEmpty) {
                            _sendMessage();
                          }
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: MyColors.primary,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Icon(
                            Iconsax.send_1,
                            color: Colors.white,
                            size: 20,
                          ),
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
    );
  }

  Widget _buildQuickActionChip(String text, IconData icon) {
    return GestureDetector(
      onTap: () {
        _messageController.text = text;
        _sendMessage();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: MyColors.primary.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: MyColors.primary),
            const SizedBox(width: 6),
            Text(
              text,
              style: GoogleFonts.cabin(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      final userMessage = _messageController.text.trim();

      setState(() {
        messages.add(
          ChatMessage(
            text: userMessage,
            isFromBot: false,
            timestamp: DateTime.now(),
          ),
        );
      });
      _messageController.clear();

      // Auto scroll to bottom
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });

      // Send AI response
      _sendBotResponseWithTyping(userMessage);
    }
  }

  void _sendBotResponseWithTyping(String userMessage) {
    // Show typing indicator
    setState(() {
      _isBotTyping = true;
    });

    // Auto scroll to show typing indicator
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });

    // Realistic delay for AI processing
    final delay = Duration(seconds: 1 + (DateTime.now().millisecond % 2));

    Future.delayed(delay, () {
      if (mounted) {
        String response = _getContextualResponse(userMessage);

        // Add follow-up question 30% of the time
        if (DateTime.now().millisecond % 10 < 3) {
          response +=
              "\n\n${legalQuestions[DateTime.now().millisecond % legalQuestions.length]}";
        }

        setState(() {
          _isBotTyping = false;
          messages.add(
            ChatMessage(
              text: response,
              isFromBot: true,
              timestamp: DateTime.now(),
            ),
          );
        });

        // Auto scroll to bottom after response
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
      }
    });
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [MyColors.primary.withOpacity(0.8), MyColors.primary],
              ),
            ),
            child: const Icon(
              Iconsax.message_programming,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.15),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "AI Legal Assistant is typing",
                  style: GoogleFonts.cabin(
                    fontSize: 14,
                    color: Colors.grey.shade400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(width: 8),
                _buildTypingAnimation(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingAnimation() {
    return SizedBox(
      width: 40,
      height: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (index) {
          return _buildAnimatedDot(index);
        }),
      ),
    );
  }

  Widget _buildAnimatedDot(int index) {
    return AnimatedBuilder(
      animation: _dotController,
      builder: (context, child) {
        final progress = (_dotController.value + (index * 0.2)) % 1.0;
        final scale = 0.5 + (progress < 0.5 ? progress : 1 - progress) * 1.0;

        return Transform.scale(
          scale: scale,
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey.shade400.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }

  // Clear Chat Function
  void _clearChat() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            "Clear Chat",
            style: GoogleFonts.cabin(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Are you sure you want to clear all messages? This action cannot be undone.",
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
                setState(() {
                  messages = [
                    ChatMessage(
                      text:
                          "Hello Sachin! I'm your AI Legal Assistant. How can I help you today?",
                      isFromBot: true,
                      timestamp: DateTime.now(),
                    ),
                  ];
                  _isBotTyping = false;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Chat cleared successfully",
                      style: GoogleFonts.cabin(color: Colors.white),
                    ),
                    backgroundColor: MyColors.primary,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
              child: Text(
                "Clear",
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

class ChatMessage {
  final String text;
  final bool isFromBot;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isFromBot,
    required this.timestamp,
  });
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: message.isFromBot
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          // Sender name
          if (message.isFromBot)
            Padding(
              padding: const EdgeInsets.only(left: 60, bottom: 4),
              child: Text(
                "AI Legal Assistant",
                style: GoogleFonts.cabin(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(right: 60, bottom: 4),
              child: Text(
                "Sachin",
                style: GoogleFonts.cabin(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
                textAlign: TextAlign.right,
              ),
            ),

          // Message bubble
          Row(
            mainAxisAlignment: message.isFromBot
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (message.isFromBot) ...[
                // Bot avatar
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
                  child: const Icon(
                    Iconsax.message_programming,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),

                // Message container
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.75,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.15),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Text(
                      message.text,
                      style: GoogleFonts.cabin(
                        fontSize: 15,
                        color: Colors.white,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
              ] else ...[
                // User message container
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.75,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: MyColors.primary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(4),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Text(
                      message.text,
                      style: GoogleFonts.cabin(
                        fontSize: 15,
                        color: Colors.white,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // User avatar
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade600,
                  ),
                  child: Center(
                    child: Text(
                      "S",
                      style: GoogleFonts.cabin(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
