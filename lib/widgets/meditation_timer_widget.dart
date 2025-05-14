import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        _controller.forward(from: _controller.value);
      }
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: 1 - _controller.value,
                    strokeWidth: 12,
                    backgroundColor: Colors.white24,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF5A189A).withOpacity(0.8),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _timeLeft,
                      style: GoogleFonts.nunito(
                        fontSize: 48,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF22223B),
                      ),
                    ),
                    Text(
                      'minutes',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Color(0xFF343A40),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: _toggleTimer,
              backgroundColor: Color(0xFF5A189A),
              child: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            FloatingActionButton(
              onPressed: () {
                _controller.reset();
                setState(() => _isPlaying = false);
              },
              backgroundColor: Color(0xFF5A189A).withOpacity(0.8),
              child: const Icon(Icons.replay, size: 28),
            ),
          ],
        ),
      ],
    );
  }
}
