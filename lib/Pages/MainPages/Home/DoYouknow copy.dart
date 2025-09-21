import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leagese/Pages/MainPages/Home/legal.dart';
import 'package:leagese/Pages/MainPages/Home/legalliteracypage.dart';
import 'package:leagese/colors.dart'; // Assuming MyColors is defined here
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leagese/Pages/MainPages/Home/legal.dart'; // Make sure this import is correct
import 'package:leagese/Pages/MainPages/Home/legalliteracypage.dart'; // Make sure this import is correct
import 'package:leagese/colors.dart'; // Make sure this import is correct

class DoYouKnow2 extends StatefulWidget {
  const DoYouKnow2({super.key});

  @override
  _DoYouKnow2State createState() => _DoYouKnow2State();
}

class _DoYouKnow2State extends State<DoYouKnow2> {
  late PageController _pageController;
  late List<Map<String, String>> _activeFacts;
  int _currentIndex = 0;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _pickRandomFive();
  }

  void _pickRandomFive() {
    final random = Random();
    // Assuming 'initialLegalFacts' is defined in your 'legal.dart' or somewhere accessible
    final shuffled = List<Map<String, String>>.from(initialLegalFacts)
      ..shuffle(random);
    setState(() {
      _activeFacts = shuffled.toList();
      _currentIndex = 0;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _dismissCard() {
    if (_isAnimating || _activeFacts.isEmpty) return;

    setState(() {
      _isAnimating = true;
    });

    int indexToRemove = _currentIndex;

    if (indexToRemove == _activeFacts.length - 1) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          setState(() {
            _activeFacts.removeAt(indexToRemove);
            _isAnimating = false;
          });
        }
      });
      return;
    }

    _pageController
        .animateToPage(
          indexToRemove + 1,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        )
        .then((_) {
          if (mounted) {
            _activeFacts.removeAt(indexToRemove);
            _pageController.jumpToPage(indexToRemove);
            setState(() {
              _isAnimating = false;
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    final isEmpty = _activeFacts.isEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 500,
            width: double.infinity,
            child: isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "All facts viewed!",
                        style: GoogleFonts.cabin(
                          color: Colors.white70,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Reshuffle Button
                          Container(
                            decoration: BoxDecoration(
                              color: MyColors.primary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton(
                              onPressed: _pickRandomFive,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 0,
                                ),
                                child: Text(
                                  "Reshuffle",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),

                          // See All Button
                          Container(
                            decoration: BoxDecoration(
                              color: MyColors.primary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const LegalLiteracyPage(),
                                  ),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 0,
                                ),
                                child: Text(
                                  "See All",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : PageView.builder(
                    // ===== FIX IS HERE =====
                    clipBehavior: Clip.none,
                    // =======================
                    controller: _pageController,
                    physics: _isAnimating
                        ? const NeverScrollableScrollPhysics()
                        : const BouncingScrollPhysics(),
                    itemCount: _activeFacts.length,
                    onPageChanged: _onPageChanged,
                    itemBuilder: (context, index) {
                      final fact = _activeFacts[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: FlipCard(
                          key: ValueKey(_activeFacts[index]['front']),
                          frontText: fact['front']!,
                          backText: fact['back']!,
                          onDismissed: _dismissCard,
                        ),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}

// CHANGED: The FlipCard is now simple again. It has NO dismiss animation logic.
class FlipCard extends StatefulWidget {
  final String frontText;
  final String backText;
  final VoidCallback onDismissed;

  const FlipCard({
    Key? key,
    required this.frontText,
    required this.backText,
    required this.onDismissed,
  }) : super(key: key);

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> with TickerProviderStateMixin {
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;
  bool _showFront = true;

  @override
  void initState() {
    super.initState();

    _flipController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _flipAnimation = Tween<double>(begin: 0, end: math.pi).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_showFront) {
      _flipController.forward();
      setState(() {
        _showFront = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _flipAnimation,
        builder: (context, child) {
          final angle = _flipAnimation.value;
          final isFront = angle <= math.pi / 2;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            child: isFront
                ? _buildCardFace(widget.frontText, isFront: true)
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: _buildCardFace(widget.backText, isFront: false),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildCardFace(String text, {required bool isFront}) {
    // ... The UI of the card face is completely unchanged ...
    Widget gridPattern = CustomPaint(
      painter: GridPainter(),
      child: Container(),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: MyColors.primary.withOpacity(0.7), width: 1),
        gradient: LinearGradient(
          colors: [
            MyColors.primary.withOpacity(0.15),
            Colors.black.withOpacity(0.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19),
        child: Stack(
          children: [
            Positioned.fill(child: gridPattern),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoMono(
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  if (isFront)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.touch_app,
                          size: 14,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "Tap to reveal",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  else
                    // The button now directly calls the callback passed from the parent
                    ElevatedButton(
                      onPressed: widget.onDismissed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.primary.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Good to know!",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  // ... This class is completely unchanged ...
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..strokeWidth = 0.5;

    for (var i = 0; i < size.width / 20; i++) {
      canvas.drawLine(Offset(i * 20, 0), Offset(i * 20, size.height), paint);
    }
    for (var i = 0; i < size.height / 20; i++) {
      canvas.drawLine(Offset(0, i * 20), Offset(size.width, i * 20), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
