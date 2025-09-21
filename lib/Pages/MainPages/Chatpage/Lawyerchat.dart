import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leagese/Pages/Onboard/screen1.dart';
import 'package:leagese/colors.dart';
import 'package:leagese/models/lawyer.dart';

class LawyerChat extends StatefulWidget {
  final Lawyer lawyer;
  const LawyerChat({super.key, required this.lawyer});

  @override
  State<LawyerChat> createState() => _LawyerChatState();
}

class _LawyerChatState extends State<LawyerChat>
    with SingleTickerProviderStateMixin {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isLawyerTyping = false;
  late AnimationController _dotController;
  @override
  void initState() {
    super.initState();
    _dotController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(); // keeps looping
  }

  // Lawyer response arrays
  final List<String> lawyerResponses = [
    "I understand your concern. Let me review that clause more carefully.",
    "That's a valid point. This could potentially be negotiated.",
    "Based on my experience, this is quite standard in these types of contracts.",
    "I'd recommend getting clarification on this specific term before signing.",
    "This clause seems favorable to you. That's good to see.",
    "Let me explain the legal implications of this section.",
    "I've seen similar cases where this became an issue later.",
    "This looks reasonable, but we should consider the long-term effects.",
    "Good question! This is actually more common than you might think.",
    "I would suggest some modifications to this particular clause.",
    "That's exactly the kind of detail we need to pay attention to.",
    "From a legal standpoint, this gives you good protection.",
    "This might be something we want to push back on during negotiations.",
    "I appreciate you bringing this up. It's an important consideration.",
    "Let me break down what this means in practical terms.",
    "This is definitely something that could work in your favor.",
    "I'd be cautious about this particular provision.",
    "That's a smart observation. Most people miss that detail.",
    "This aligns well with industry standards.",
    "We should definitely discuss the risks associated with this.",
  ];

  final List<String> followUpQuestions = [
    "What are your thoughts on the timeline mentioned?",
    "Have you dealt with similar agreements before?",
    "Are you comfortable with the financial terms outlined?",
    "Do you have any concerns about the termination clause?",
    "Would you like me to explain any other sections?",
    "How does this compare to what you were expecting?",
    "Are there any specific risks you're worried about?",
    "Do you need clarification on the payment schedule?",
    "What's your main priority in this agreement?",
    "Should we schedule a more detailed review session?",
  ];

  List<ChatMessage> messages = [
    ChatMessage(
      text:
          "Hi there! I've reviewed your documents and have a few questions. Are you available for a quick chat?",
      isFromLawyer: true,
      timestamp: DateTime.now().subtract(Duration(minutes: 10)),
    ),
    ChatMessage(
      text: "Yes, I'm available now. What questions do you have?",
      isFromLawyer: false,
      timestamp: DateTime.now().subtract(Duration(minutes: 8)),
    ),
    ChatMessage(
      text:
          "Great! I noticed a clause regarding intellectual property rights. Could you clarify the specifics of your ownership in this matter?",
      isFromLawyer: true,
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
    ),
    ChatMessage(
      text:
          "I own the copyright to all original works created under this agreement. The company has a license to use them for the duration of the contract.",
      isFromLawyer: false,
      timestamp: DateTime.now().subtract(Duration(minutes: 3)),
    ),
    ChatMessage(
      text:
          "Understood. Let's discuss the implications of this in more detail. Would you like to schedule a brief consultation?",
      isFromLawyer: true,
      timestamp: DateTime.now().subtract(Duration(minutes: 1)),
    ),
  ];

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
                    itemCount: messages.length + (_isLawyerTyping ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == messages.length && _isLawyerTyping) {
                        return _buildTypingIndicator();
                      }
                      return ChatBubble(
                        message: messages[index],
                        lawyer: widget.lawyer,
                      );
                    },
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
                              hintText: "Type a message...",
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

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.add(
          ChatMessage(
            text: _messageController.text.trim(),
            isFromLawyer: false,
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

      // Send automatic lawyer response with typing indicator
      _sendLawyerResponseWithTyping();
    }
  }

  void _sendLawyerResponseWithTyping() {
    // Show typing indicator
    setState(() {
      _isLawyerTyping = true;
    });

    // Auto scroll to show typing indicator
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });

    // Random delay between 2-4 seconds
    final delay = Duration(seconds: 2 + (DateTime.now().millisecond % 3));

    Future.delayed(delay, () {
      if (mounted) {
        final random = DateTime.now().millisecond;
        String response;

        // 70% chance of regular response, 30% chance of follow-up question
        if (random % 10 < 7) {
          response = lawyerResponses[random % lawyerResponses.length];
        } else {
          response = followUpQuestions[random % followUpQuestions.length];
        }

        setState(() {
          _isLawyerTyping = false;
          messages.add(
            ChatMessage(
              text: response,
              isFromLawyer: true,
              timestamp: DateTime.now(),
            ),
          );
        });

        // Auto scroll to bottom after lawyer response
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(widget.lawyer.image, fit: BoxFit.cover),
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
                  "${widget.lawyer.name} is typing",
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
        // Each dot gets a phase shift
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
                  messages.clear();
                  _isLawyerTyping = false;
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

  // More Options Menu
  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
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

              // Clear Chat option
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  _clearChat();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Iconsax.message_minus,
                          color: Colors.red,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Clear Chat",
                              style: GoogleFonts.cabin(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "Delete all messages",
                              style: GoogleFonts.cabin(
                                fontSize: 12,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Iconsax.arrow_right_3,
                        color: Colors.grey.shade600,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
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
          "Chat",
          style: GoogleFonts.cabin(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: _showMoreOptions,
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: MyColors.textPrimary.withOpacity(0.28),
            ),
            child: const Icon(Iconsax.more, color: Colors.white, size: 20),
          ),
        ),
      ],
    );
  }
}

class ChatMessage {
  final String text;
  final bool isFromLawyer;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isFromLawyer,
    required this.timestamp,
  });
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  final Lawyer lawyer;

  const ChatBubble({super.key, required this.message, required this.lawyer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: message.isFromLawyer
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          // Sender name
          if (message.isFromLawyer)
            Padding(
              padding: const EdgeInsets.only(left: 60, bottom: 4),
              child: Text(
                "${lawyer.name}",
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
                "You",
                style: GoogleFonts.cabin(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
                textAlign: TextAlign.right,
              ),
            ),

          // Message bubble
          Row(
            mainAxisAlignment: message.isFromLawyer
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (message.isFromLawyer) ...[
                // Lawyer avatar
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
                    child: Image.asset(lawyer.image, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 12),

                // Message container
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
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
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
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
                  child: const Icon(
                    Iconsax.user,
                    color: Colors.white,
                    size: 20,
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
