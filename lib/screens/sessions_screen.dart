import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'Sessions',
          style: GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
