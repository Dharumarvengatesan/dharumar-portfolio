import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

const _skills = [
  'Flutter', 'Dart', 'Java', 'Kotlin', 'Firebase',
  'REST API', 'Provider', 'BLoC', 'GetX', 'SQLite',
  'Hive', 'Git', 'CI/CD', 'Agile', 'Android', 'iOS', 'Web', 'Desktop',
];

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      color: AppTheme.bgColorAlt,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: 80),
      child: Column(
        children: [
          const _SectionTitle(title: 'My', highlight: 'Skills'),
          const SizedBox(height: 48),
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: List.generate(_skills.length, (i) {
                return _SkillChip(label: _skills[i]);
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String label;
  const _SkillChip({required this.label});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: _hovered
              ? AppTheme.accentPurple.withValues(alpha: 0.1)
              : Colors.white.withValues(alpha: 0.85),
          border: Border.all(
            color: _hovered
                ? AppTheme.accentCyan
                : const Color(0xFF6366F1).withValues(alpha: 0.18),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6366F1).withValues(alpha: 0.08),
              blurRadius: 8,
            ),
          ],
        ),
        child: Text(
          widget.label,
          style: AppTheme.bodyLarge.copyWith(
            color: _hovered ? AppTheme.accentCyan : const Color(0xFF1A1A2E),
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String highlight;
  const _SectionTitle({required this.title, required this.highlight});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
            fontSize: 36, fontWeight: FontWeight.w800, color: AppTheme.textMain),
        children: [
          TextSpan(text: '$title '),
          WidgetSpan(
            child: ShaderMask(
              shaderCallback: (bounds) =>
                  AppTheme.cyanPurpleGradient.createShader(bounds),
              child: const Text('Skills',
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
