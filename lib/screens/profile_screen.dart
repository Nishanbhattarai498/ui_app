import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: AppGradients.mainGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: AppGradients.cardGradient,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(4),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person_outline_rounded,
                    size: 50,
                    color: Color(0xFF4F566B),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Sarah Johnson',
                style: GoogleFonts.nunito(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textLight,
                ),
              ),
              Text(
                'Mindfulness Explorer',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: AppColors.textLight.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 32),
              _buildStatCard(
                icon: Icons.local_fire_department_outlined,
                value: '7',
                label: 'Day Streak',
                gradient: AppGradients.cardGradient,
              ),
              const SizedBox(height: 24),
              _buildStatCard(
                icon: Icons.timer_outlined,
                value: '126',
                label: 'Minutes Meditated',
                gradient: AppGradients.accentGradient,
              ),
              const SizedBox(height: 24),
              _buildAchievementsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Gradient gradient,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: GoogleFonts.nunito(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                label,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildAchievementTile(
            icon: Icons.star_rounded,
            title: 'Early Bird',
            subtitle: 'Complete 5 morning meditations',
            progress: 0.8,
          ),
          _buildAchievementTile(
            icon: Icons.self_improvement_rounded,
            title: 'Zen Master',
            subtitle: 'Meditate for 30 days in a row',
            progress: 0.4,
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required double progress,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      leading: CircleAvatar(
        backgroundColor: AppColors.primary.withOpacity(0.1),
        child: Icon(icon, color: AppColors.primary),
      ),
      title: Text(
        title,
        style: GoogleFonts.nunito(
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: GoogleFonts.lato(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: AppColors.primary.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ],
      ),
    );
  }
}
