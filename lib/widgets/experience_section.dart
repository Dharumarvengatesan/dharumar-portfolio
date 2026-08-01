import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/experience_model.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      color: AppTheme.bgColor,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: 80),
      child: Column(
        children: [
          const _SectionTitle(),
          const SizedBox(height: 48),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                children: List.generate(experiences.length, (i) {
                  final exp = experiences[i];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: _ExperienceCard(exp: exp, index: i),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final ExperienceModel exp;
  final int index;
  const _ExperienceCard({required this.exp, required this.index});

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _slide = Tween<Offset>(
      begin: const Offset(-0.05, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Staggered start — delayed per card index
    Future.delayed(Duration(milliseconds: widget.index * 100), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _slide,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Card body with uniform border
              Container(
                padding: const EdgeInsets.fromLTRB(28, 24, 24, 24),
                decoration: BoxDecoration(
                  color: AppTheme.glass,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.glassBorder),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header row
                    isMobile
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLeft(),
                              const SizedBox(height: 8),
                              _buildRight(),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: _buildLeft()),
                              _buildRight(),
                            ],
                          ),
                    const SizedBox(height: 12),

                    // Tech tags
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children:
                          widget.exp.tech.map((t) => _TechTag(t)).toList(),
                    ),
                    const SizedBox(height: 12),

                    // Description bullets
                    ...widget.exp.description.map(
                      (d) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• ',
                                style: TextStyle(color: AppTheme.textMuted)),
                            Expanded(
                                child: Text(d, style: AppTheme.bodyLarge)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Left accent bar
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                child: Container(
                  width: 4,
                  decoration: const BoxDecoration(
                    color: AppTheme.accentCyan,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

  Widget _buildLeft() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.exp.role,
            style: AppTheme.headingMedium
                .copyWith(fontSize: 18, fontWeight: FontWeight.w700)),
        const SizedBox(height: 4),
        Text(widget.exp.company,
            style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.accentPurple,
                fontWeight: FontWeight.w500,
                fontSize: 15)),
        if (widget.exp.note != null) ...[
          const SizedBox(height: 2),
          Text(widget.exp.note!,
              style: AppTheme.bodySmall.copyWith(
                  color: AppTheme.accentCyan,
                  fontStyle: FontStyle.italic)),
        ],
      ],
    );
  }

  Widget _buildRight() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(widget.exp.period,
            style: AppTheme.labelStyle
                .copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
        const SizedBox(height: 2),
        Text(widget.exp.location, style: AppTheme.bodySmall),
      ],
    );
  }
}

class _TechTag extends StatelessWidget {
  final String label;
  const _TechTag(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.accentCyan.withValues(alpha: 0.1),
        border: Border.all(
            color: AppTheme.accentCyan.withValues(alpha: 0.25)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label,
          style: AppTheme.labelStyle.copyWith(fontSize: 11)),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle();

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: AppTheme.textMain),
        children: [
          const TextSpan(text: 'Professional '),
          WidgetSpan(
            child: ShaderMask(
              shaderCallback: (bounds) =>
                  AppTheme.cyanPurpleGradient.createShader(bounds),
              child: const Text('Experience',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
