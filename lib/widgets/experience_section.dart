import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
          _SectionTitle(),
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

class _ExperienceCard extends StatelessWidget {
  final ExperienceModel exp;
  final int index;
  const _ExperienceCard({required this.exp, required this.index});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.glass,
        borderRadius: BorderRadius.circular(16),
        border: const Border(
          left: BorderSide(color: AppTheme.accentCyan, width: 4),
          top: BorderSide(color: AppTheme.glassBorder),
          right: BorderSide(color: AppTheme.glassBorder),
          bottom: BorderSide(color: AppTheme.glassBorder),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_buildLeft(), const SizedBox(height: 8), _buildRight()],
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
            children: exp.tech.map((t) => _TechTag(t)).toList(),
          ),
          const SizedBox(height: 12),
          // Description
          ...exp.description.map((d) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ',
                        style: TextStyle(color: AppTheme.textMuted)),
                    Expanded(child: Text(d, style: AppTheme.bodyLarge)),
                  ],
                ),
              )),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: index * 100), duration: 500.ms)
        .slideX(begin: -0.1, end: 0);
  }

  Widget _buildLeft() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(exp.role,
            style: AppTheme.headingMedium
                .copyWith(fontSize: 18, fontWeight: FontWeight.w700)),
        const SizedBox(height: 4),
        Text(exp.company,
            style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.accentPurple,
                fontWeight: FontWeight.w500,
                fontSize: 15)),
        if (exp.note != null) ...[
          const SizedBox(height: 2),
          Text(exp.note!,
              style: AppTheme.bodySmall.copyWith(
                  color: AppTheme.accentCyan, fontStyle: FontStyle.italic)),
        ],
      ],
    );
  }

  Widget _buildRight() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(exp.period,
            style: AppTheme.labelStyle
                .copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
        const SizedBox(height: 2),
        Text(exp.location, style: AppTheme.bodySmall),
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
        border: Border.all(color: AppTheme.accentCyan.withValues(alpha: 0.25)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: AppTheme.labelStyle.copyWith(fontSize: 11)),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
            fontSize: 36, fontWeight: FontWeight.w800, color: AppTheme.textMain),
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
    ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.2, end: 0);
  }
}
