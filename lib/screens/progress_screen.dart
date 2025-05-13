import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'Progress',
          style: GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
