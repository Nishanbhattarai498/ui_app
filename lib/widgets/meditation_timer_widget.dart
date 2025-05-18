import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import 'dart:math' as math;

class MeditationTimerWidget extends StatefulWidget {
  final int durationMinutes;
  final VoidCallback? onComplete;

  const MeditationTimerWidget({
    super.key,
    this.durationMinutes = 10,
    this.onComplete,
  });

  @override
  State<MeditationTimerWidget> createState() => _MeditationTimerWidgetState();
}

class _MeditationTimerWidgetState extends State<MeditationTimerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
          vsync: this,
          duration: Duration(minutes: widget.durationMinutes),
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            setState(() => _isPlaying = false);
            widget.onComplete?.call();
          }
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String get _timeLeft {
    final duration = _controller.duration! * (1 - _controller.value);
    final minutes = duration.inMinutes;
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _toggleTimer() {
    setState(() {
      if (_isPlaying) {
        _controller.stop();
      } else {
        if (_controller.value == 1.0) {
          _controller.reset();
        }
        _controller.forward();
      }
      _isPlaying = !_isPlaying;
    });
  }

  void _resetTimer() {
    setState(() {
      _controller.reset();
      _isPlaying = false;
    });
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
            'Meditation Timer',
            style: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 200,
            width: 200,
            child: Stack(
              fit: StackFit.expand,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: TimerPainter(
                        animation: _controller,
                        backgroundColor: AppColors.cardBg,
                        color: AppColors.accent,
                      ),
                    );
                  },
                ),
                Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _timeLeft,
                            style: GoogleFonts.nunito(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textLight,
                            ),
                          ),
                          Text(
                            'remaining',
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: AppColors.textLight.withOpacity(0.7),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _resetTimer,
                icon: Icon(
                  Icons.refresh_rounded,
                  color: AppColors.textLight.withOpacity(0.7),
                  size: 32,
                ),
              ),
              const SizedBox(width: 24),
              GestureDetector(
                onTap: _toggleTimer,
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.accent.withOpacity(0.15),
                  ),
                  child: Icon(
                    _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    color: AppColors.accent,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  final Animation<double> animation;
  final Color backgroundColor, color;

  TimerPainter({
    required this.animation,
    required this.backgroundColor,
    required this.color,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double progress = (1.0 - animation.value) * 2 * math.pi;

    canvas.drawCircle(
      size.center(Offset.zero),
      size.width / 2.0,
      paint..color = color.withOpacity(0.2),
    );

    paint.color = color;
    canvas.drawArc(Offset.zero & size, -math.pi / 2, progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter oldDelegate) {
    return animation.value != oldDelegate.animation.value ||
        color != oldDelegate.color ||
        backgroundColor != oldDelegate.backgroundColor;
  }
}
