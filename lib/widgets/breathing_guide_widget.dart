import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BreathingGuideWidget extends StatefulWidget {
  const BreathingGuideWidget({super.key});

  @override
  State<BreathingGuideWidget> createState() => _BreathingGuideWidgetState();
}

class _BreathingGuideWidgetState extends State<BreathingGuideWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
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
    _animation = Tween<double>(
      begin: 0.7,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppGradients.yogaCard,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _phases[_phase],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        Text(
          'Breathing Guide',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }
}
