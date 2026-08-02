import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback? onContactTap;
  const HeroSection({super.key, this.onContactTap});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _floatController;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final size = MediaQuery.of(context).size;

        return Container(
          constraints: isMobile
              ? const BoxConstraints()
              : BoxConstraints(minHeight: size.height),
          padding: EdgeInsets.fromLTRB(
            isMobile ? 20 : 80,
            isMobile ? 70 : 120,
            isMobile ? 20 : 80,
            isMobile ? 36 : 60,
          ),
          child: isMobile
              ? _buildMobileLayout()
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _buildText(isMobile: false)),
                    const SizedBox(width: 60),
                    _buildPhoto(isMobile: false),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Photo + text side by side on mobile (compact)
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: _buildText(isMobile: true)),
            const SizedBox(width: 12),
            _buildPhoto(isMobile: true),
          ],
        ),
      ],
    );
  }

  Widget _buildText({required bool isMobile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Available badge
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 10 : 16, vertical: isMobile ? 6 : 8),
          decoration: BoxDecoration(
            color: AppTheme.accentCyan.withValues(alpha: 0.1),
            border:
                Border.all(color: AppTheme.accentCyan.withValues(alpha: 0.25)),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.accentCyan,
                  boxShadow: [
                    BoxShadow(color: AppTheme.accentCyan, blurRadius: 6),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Text('Available for opportunities',
                  style: AppTheme.labelStyle.copyWith(
                      fontSize: isMobile ? 11 : 14,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),

        SizedBox(height: isMobile ? 12 : 20),

        Text('Hi, my name is',
            style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textMuted,
                fontSize: isMobile ? 13 : 17,
                fontWeight: FontWeight.w500)),

        SizedBox(height: isMobile ? 4 : 8),

        Text('Dharumar V.',
            style: AppTheme.displayLarge.copyWith(
              fontSize: isMobile ? 28 : 64,
            )),

        SizedBox(height: isMobile ? 4 : 8),

        ShaderMask(
          shaderCallback: (bounds) =>
              AppTheme.cyanPurpleGradient.createShader(bounds),
          child: Text(
            'Senior Flutter Developer',
            style: AppTheme.displayMedium.copyWith(
              color: Colors.white,
              fontSize: isMobile ? 15 : 32,
            ),
          ),
        ),

        SizedBox(height: isMobile ? 8 : 16),

        Text(
          '6+ years building scalable cross-platform mobile applications using Flutter, Firebase, REST APIs, and clean architecture.',
          style: AppTheme.bodyLarge.copyWith(fontSize: isMobile ? 12 : 16),
          textAlign: TextAlign.start,
        ),

        SizedBox(height: isMobile ? 14 : 24),

        // Stats
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _StatItem('6+', 'Years Exp.', isMobile),
            SizedBox(width: isMobile ? 16 : 32),
            _StatItem('6+', 'Live Apps', isMobile),
            SizedBox(width: isMobile ? 16 : 32),
            _StatItem('99.9%', 'Crash-Free', isMobile),
          ],
        ),

        SizedBox(height: isMobile ? 18 : 32),

        // CTA Buttons
        Wrap(
          spacing: 12,
          runSpacing: 10,
          children: [
            _PrimaryButton('View Apps',
                () => _launchUrl(
                    'https://play.google.com/store/apps/dev?id=8687668766227765637'),
                isMobile: isMobile),
            _OutlineButton('Contact Me', () {
              widget.onContactTap?.call();
            }, isMobile: isMobile),
          ],
        ),
      ],
    );
  }

  Widget _buildPhoto({required bool isMobile}) {
    final photoSize = isMobile ? 160.0 : 300.0;
    return AnimatedBuilder(
      animation: _floatController,
      builder: (context, child) {
        final offset = (_floatController.value - 0.5) * 12;
        return Transform.translate(
          offset: Offset(0, offset),
          child: child,
        );
      },
      child: SizedBox(
        width: isMobile ? photoSize + 40 : photoSize + 60,
        height: isMobile ? photoSize + 40 : photoSize + 60,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // Gradient ring
            Container(
              width: photoSize + 16,
              height: photoSize + 16,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppTheme.cyanPurpleGradient,
              ),
            ),
            // Gap ring
            Container(
              width: photoSize + 6,
              height: photoSize + 6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.bgColor,
              ),
            ),
            // Profile photo
            ClipOval(
              child: Image.asset(
                'assets/images/profile.jpg',
                width: photoSize,
                height: photoSize,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: photoSize,
                  height: photoSize,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppTheme.cyanPurpleGradient,
                  ),
                  child: Center(
                    child: Text('DV',
                        style: AppTheme.displayMedium
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ),
            ),
            // Flutter Expert badge
            Positioned(
              bottom: 30,
              left: 0,
              child: _FloatingBadge(
                icon: _flutterIcon(),
                label: 'Flutter Expert',
                color: AppTheme.accentCyan,
                delay: 0,
              ),
            ),
            // Open to Work badge
            const Positioned(
              top: 30,
              right: 0,
              child: _FloatingBadge(
                icon: Text('🚀', style: TextStyle(fontSize: 14)),
                label: 'Open to Work',
                color: AppTheme.accentPurple,
                delay: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _flutterIcon() {
    return SizedBox(
      width: 18,
      height: 18,
      child: CustomPaint(painter: _FlutterIconPainter()),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final bool isMobile;
  const _StatItem(this.value, this.label, this.isMobile);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) =>
              AppTheme.cyanPurpleGradient.createShader(bounds),
          child: Text(value,
              style: AppTheme.headingLarge.copyWith(
                  color: Colors.white,
                  fontSize: isMobile ? 18 : 26,
                  fontWeight: FontWeight.w800)),
        ),
        Text(label,
            style: AppTheme.bodySmall
                .copyWith(fontSize: isMobile ? 10 : 13)),
      ],
    );
  }
}

class _PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isMobile;
  const _PrimaryButton(this.label, this.onTap, {this.isMobile = false});

  @override
  State<_PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<_PrimaryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
              horizontal: widget.isMobile ? 20 : 28,
              vertical: widget.isMobile ? 10 : 14),
          decoration: BoxDecoration(
            gradient: AppTheme.cyanPurpleGradient,
            borderRadius: BorderRadius.circular(50),
            boxShadow: _hovered
                ? [BoxShadow(
                    color: AppTheme.accentCyan.withValues(alpha: 0.4),
                    blurRadius: 20)]
                : const [],
          ),
          child: Text(widget.label,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: widget.isMobile ? 13 : 15)),
        ),
      ),
    );
  }
}

class _OutlineButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isMobile;
  const _OutlineButton(this.label, this.onTap, {this.isMobile = false});

  @override
  State<_OutlineButton> createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<_OutlineButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
              horizontal: widget.isMobile ? 20 : 28,
              vertical: widget.isMobile ? 10 : 14),
          decoration: BoxDecoration(
            color: _hovered
                ? AppTheme.accentCyan.withValues(alpha: 0.1)
                : Colors.transparent,
            border: Border.all(
                color: _hovered ? AppTheme.accentCyan : AppTheme.glassBorder),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(widget.label,
              style: TextStyle(
                  color: _hovered ? AppTheme.accentCyan : AppTheme.textMain,
                  fontWeight: FontWeight.w600,
                  fontSize: widget.isMobile ? 13 : 15)),
        ),
      ),
    );
  }
}

class _FloatingBadge extends StatelessWidget {
  final Widget icon;
  final String label;
  final Color color;
  final double delay;
  const _FloatingBadge(
      {required this.icon,
      required this.label,
      required this.color,
      required this.delay});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.2), blurRadius: 16)
        ],
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 6),
          Text(label,
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: color == AppTheme.accentCyan
                      ? const Color(0xFF1A1A2E)
                      : AppTheme.accentPurple)),
        ],
      ),
    );
  }
}

class _FlutterIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    paint.color = const Color(0xFF54C5F8);
    canvas.drawPolygon([
      Offset(size.width * 0.29, size.height * 0.125),
      Offset(size.width * 0.71, size.height * 0.125),
      Offset(size.width, size.height * 0.42),
      Offset(size.width * 0.58, size.height * 0.42),
    ], paint);
    paint.color = const Color(0xFF29B6F6);
    canvas.drawPolygon([
      Offset(size.width * 0.58, size.height * 0.42),
      Offset(size.width * 0.29, size.height * 0.71),
      Offset(size.width * 0.58, size.height * 0.71),
      Offset(size.width * 0.88, size.height * 0.42),
    ], paint);
    paint.color = const Color(0xFF01579B);
    canvas.drawPolygon([
      Offset(size.width * 0.29, size.height * 0.875),
      Offset(size.width * 0.71, size.height * 0.875),
      Offset(size.width, size.height * 0.58),
      Offset(size.width * 0.58, size.height * 0.58),
    ], paint);
    paint.color = const Color(0xFF0D47A1);
    canvas.drawPolygon([
      Offset(size.width * 0.29, size.height * 0.71),
      Offset(size.width * 0.58, size.height * 0.71),
      Offset(size.width * 0.44, size.height * 0.855),
      Offset(size.width * 0.14, size.height * 0.855),
    ], paint);
  }

  @override
  bool shouldRepaint(_FlutterIconPainter old) => false;
}

extension on Canvas {
  void drawPolygon(List<Offset> points, Paint paint) {
    if (points.isEmpty) return;
    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (final p in points.skip(1)) {
      path.lineTo(p.dx, p.dy);
    }
    path.close();
    drawPath(path, paint);
  }
}
