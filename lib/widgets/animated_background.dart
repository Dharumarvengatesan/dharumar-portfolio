import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        // ── Static base gradient (never repaints) ───────────────────────
        const DecoratedBox(
          decoration: BoxDecoration(gradient: AppTheme.bgGradient),
          child: SizedBox.expand(),
        ),

        // ── Static grid — outside AnimatedBuilder so it only paints once ─
        CustomPaint(
          painter: _GridPainter(),
          size: screenSize,
        ),

        // ── Animated orbs (only this subtree repaints at 60 fps) ────────
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Stack(
              children: [
                Positioned(
                  top: -100 + (_controller.value * 60),
                  right: -80 + (_controller.value * 40),
                  child: _Orb(
                    size: 500,
                    color: AppTheme.accentCyan.withValues(alpha: 0.06),
                  ),
                ),
                Positioned(
                  bottom: -120 + (_controller.value * 50),
                  left: -100 + (_controller.value * 30),
                  child: _Orb(
                    size: 600,
                    color: AppTheme.accentPurple.withValues(alpha: 0.06),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _Orb extends StatelessWidget {
  final double size;
  final Color color;
  const _Orb({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, Colors.transparent],
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.025)
      ..strokeWidth = 1;

    const spacing = 60.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) => false;
}
