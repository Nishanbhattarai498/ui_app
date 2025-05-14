import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textLight),
      ),
      body: Stack(
        children: [
          Container(
            height: 320,
            decoration: BoxDecoration(
              gradient: AppGradients.mainGradient,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 32,
                  offset: Offset(0, 8),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 80,
              left: 24,
              right: 24,
              bottom: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.self_improvement_outlined,
                      size: 56,
                      color: Color(0xFF5A189A), // Deep purple for icon
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Mindful Breathing',
                  style: GoogleFonts.nunito(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF22223B), // Very dark blue for max contrast
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'A calming meditation session to help you focus on your breath and relax your mind. Perfect for beginners and experienced practitioners alike.',
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    color: Color(0xFF343A40), // Dark gray for body text
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(
                        0xFF5A189A,
                      ), // Deep purple for button
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      elevation: 10,
                      shadowColor: Colors.black26,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Start',
                      style: GoogleFonts.nunito(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.1,
                      ),
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
}
