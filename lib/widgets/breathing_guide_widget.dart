import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BreathingGuideWidget extends StatefulWidget {
  const BreathingGuideWidget({super.key});

  @override
  State<BreathingGuideWidget> createState() => _BreathingGuideWidgetState();
}

class _BreathingGuideWidgetState extends State<BreathingGuideWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  int _phase = 0; // 0: Inhale, 1: Hold, 2: Exhale
  final List<String> _phases = ['Inhale', 'Hold', 'Exhale'];
  final List<int> _durations = [4, 4, 6]; // seconds for each phase

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
          vsync: this,
          duration: Duration(seconds: _durations[_phase]),
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            setState(() {
              _phase = (_phase + 1) % 3;
              _controller.duration = Duration(seconds: _durations[_phase]);
              _controller.forward(from: 0);
            });
          }
        });

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getPhaseColor() {
    switch (_phase) {
      case 0: // Inhale
        return AppColors.accent;
      case 1: // Hold
        return AppColors.secondary;
      case 2: // Exhale
        return AppColors.primary;
      default:
        return AppColors.accent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Breathing Exercise',
            style: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight,
            ),
          ),
          const SizedBox(height: 24),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  ...List.generate(3, (index) {
                    return Transform.scale(
                      scale: _scaleAnimation.value - (index * 0.1),
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _getPhaseColor().withOpacity(
                              _opacityAnimation.value - (index * 0.2),
                            ),
                            width: 2,
                          ),
                        ),
                      ),
                    );
                  }),
                  Column(
                    children: [
                      Text(
                        _phases[_phase],
                        style: GoogleFonts.nunito(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: _getPhaseColor(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${(_controller.value * _durations[_phase]).toInt()}s',
                        style: GoogleFonts.nunito(
                          fontSize: 18,
                          color: AppColors.textLight.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {
              if (_controller.isAnimating) {
                _controller.stop();
              } else {
                _controller.forward();
              }
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              backgroundColor: AppColors.accent.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              _controller.isAnimating ? 'Pause' : 'Start',
              style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.accent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
