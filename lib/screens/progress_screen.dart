import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB9F3E4), // Mint
              Color(0xFFFFE5B4), // Light Peach
              Color(0xFFE0C3FC), // Soft Purple
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Progress',
                style: GoogleFonts.nunito(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF22223B),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Track your meditation and yoga journey',
                style: GoogleFonts.lato(
                  fontSize: 18,
                  color: Color(0xFF343A40),
                ),
              ),
              const SizedBox(height: 32),
              _buildWeeklyStatsCard(),
              const SizedBox(height: 24),
              _buildMoodTracker(),
              const SizedBox(height: 24),
              _buildStreakCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeeklyStatsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Activity',
            style: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF22223B),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 60,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            days[value.toInt()],
                            style: GoogleFonts.lato(
                              color: Color(0xFF343A40),
                              fontSize: 14,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            '${value.toInt()}m',
                            style: GoogleFonts.lato(
                              color: Color(0xFF343A40),
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barGroups: [
                  _generateBarGroup(0, 20),
                  _generateBarGroup(1, 35),
                  _generateBarGroup(2, 45),
                  _generateBarGroup(3, 30),
                  _generateBarGroup(4, 25),
                  _generateBarGroup(5, 40),
                  _generateBarGroup(6, 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _generateBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          gradient: LinearGradient(
            colors: [
              Color(0xFF5A189A),
              Color(0xFF7B2CBF),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          width: 20,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }

  Widget _buildMoodTracker() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mood Tracker',
            style: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF22223B),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMoodItem(Icons.sentiment_very_satisfied, 'Great', true),
              _buildMoodItem(Icons.sentiment_satisfied, 'Good'),
              _buildMoodItem(Icons.sentiment_neutral, 'Okay'),
              _buildMoodItem(Icons.sentiment_dissatisfied, 'Bad'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMoodItem(IconData icon, String label, [bool isSelected = false]) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF5A189A) : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? Color(0xFF5A189A) : Color(0xFF343A40),
              width: 2,
            ),
          ),
          child: Icon(
            icon,
            color: isSelected ? Colors.white : Color(0xFF343A40),
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.lato(
            fontSize: 14,
            color: Color(0xFF343A40),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildStreakCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF5A189A),
            Color(0xFF7B2CBF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.local_fire_department,
            color: Colors.white,
            size: 48,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '7 Day Streak! 🎉',
                style: GoogleFonts.nunito(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Keep up the great work!',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
            style: GoogleFonts.nunito(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.sageGreen,
            ),
          ),
        ),
      ),
    );
  }
}
