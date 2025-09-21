import 'package:flutter/material.dart';

class GradientPage extends StatelessWidget {
  const GradientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Left side gradient
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(-0.8, -1.2),
                radius: 1.0,
                colors: [
                  const Color(0xFF3A86FF).withOpacity(0.7),
                  Colors.transparent,
                ],
                stops: const [0.1, 1.0],
              ),
            ),
          ),
          // Right side gradient
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0.8, -1.2),
                radius: 1.0,
                colors: [
                  const Color(0xFF3A86FF).withOpacity(0.7),
                  Colors.transparent,
                ],
                stops: const [0.1, 1.0],
              ),
            ),
          ),
          const Center(
            child: Text(
              'Your Content Here',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
