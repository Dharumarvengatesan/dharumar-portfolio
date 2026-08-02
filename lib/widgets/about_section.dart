import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isSmallMobile = screenWidth < 400;

    return Container(
      color: AppTheme.bgColor,
      padding: EdgeInsets.symmetric(
          horizontal: isSmallMobile ? 16 : isMobile ? 20 : 80,
          vertical: isMobile ? 52 : 80),
      child: Column(
        children: [
          // ── Title ──────────────────────────────────────────
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textMain),
              children: [
                const TextSpan(text: 'About '),
                WidgetSpan(
                  child: ShaderMask(
                    shaderCallback: (bounds) =>
                        AppTheme.cyanPurpleGradient.createShader(bounds),
                    child: Text('Me',
                        style: TextStyle(
                            fontSize: isMobile ? 28 : 36,
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // ── Subtitle ───────────────────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 0),
            child: Text(
              'Passionate Flutter developer crafting high-quality cross-platform apps',
              textAlign: TextAlign.center,
              style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textMuted,
                  fontSize: isMobile ? 13 : 15,
                  fontWeight: FontWeight.w400),
            ),
          ),

          SizedBox(height: isMobile ? 32 : 52),

          // ── Cards ──────────────────────────────────────────
          isMobile
              ? Column(
                  children: _cards(isMobile: true, isSmallMobile: isSmallMobile)
                      .map((c) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: c,
                          ))
                      .toList(),
                )
              : IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _cards(isMobile: false, isSmallMobile: false)
                        .map((c) => Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: c,
                              ),
                            ))
                        .toList(),
                  ),
                ),
        ],
      ),
    );
  }

  List<Widget> _cards(
          {required bool isMobile, required bool isSmallMobile}) =>
      [
        _AboutCard(
          icon: Icons.workspace_premium_rounded,
          accentColor: AppTheme.accentCyan,
          title: 'Experience',
          content: _ExperienceContent(isMobile: isMobile),
        ),
        _AboutCard(
          icon: Icons.psychology_rounded,
          accentColor: AppTheme.accentPurple,
          title: 'Expertise',
          content: const _ExpertiseContent(),
        ),
        _AboutCard(
          icon: Icons.trending_up_rounded,
          accentColor: AppTheme.accentCyan,
          title: 'Impact',
          content: const _ImpactContent(),
        ),
      ];
}

// ── Card Shell ──────────────────────────────────────────────────────────────

class _AboutCard extends StatelessWidget {
  final IconData icon;
  final Color accentColor;
  final String title;
  final Widget content;

  const _AboutCard({
    required this.icon,
    required this.accentColor,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.glass,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.glassBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top accent bar
          Container(
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                accentColor,
                accentColor.withValues(alpha: 0.25),
              ]),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon + Title row
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            accentColor.withValues(alpha: 0.18),
                            accentColor.withValues(alpha: 0.04),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: accentColor.withValues(alpha: 0.35)),
                      ),
                      child: Icon(icon, color: accentColor, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Text(title,
                        style: AppTheme.headingMedium.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w700)),
                  ],
                ),

                const SizedBox(height: 18),

                // Gradient divider
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      accentColor.withValues(alpha: 0.4),
                      Colors.transparent,
                    ]),
                  ),
                ),

                const SizedBox(height: 18),

                content,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Experience Content ──────────────────────────────────────────────────────

class _ExperienceContent extends StatelessWidget {
  final bool isMobile;
  const _ExperienceContent({this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Badge('Role', 'Senior Flutter Developer', AppTheme.accentCyan),
        const SizedBox(height: 10),
        _Badge('Experience', '6+ Years', AppTheme.accentPurple),
        const SizedBox(height: 16),
        Text(
          '6+ years crafting native-feeling Android & iOS apps with Flutter — from clean architecture to CI/CD pipelines and Play Store deployment.',
          style: AppTheme.bodyLarge.copyWith(height: 1.65, fontSize: 13),
        ),
        const SizedBox(height: 18),
        // Mini stats — wrap on mobile using Wrap instead of Row
        isMobile
            ? Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  _MiniStatBox('6+', 'Apps\nLaunched', AppTheme.accentCyan),
                  _MiniStatBox('99.9%', 'Crash-\nFree', AppTheme.accentPurple),
                  _MiniStatBox('6+', 'Years\nExp.', AppTheme.accentCyan),
                ],
              )
            : Row(
                children: [
                  _MiniStat('6+', 'Apps\nLaunched', AppTheme.accentCyan),
                  const SizedBox(width: 12),
                  _MiniStat('99.9%', 'Crash-\nFree', AppTheme.accentPurple),
                  const SizedBox(width: 12),
                  _MiniStat('6+', 'Years\nExp.', AppTheme.accentCyan),
                ],
              ),
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _Badge(this.label, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: color.withValues(alpha: 0.25)),
          ),
          child: Text(label,
              style: TextStyle(
                  color: color,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5)),
        ),
        Text(value,
            style: AppTheme.bodyLarge
                .copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
      ],
    );
  }
}

// Fixed-width mini stat box for Wrap layout (mobile)
class _MiniStatBox extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  const _MiniStatBox(this.value, this.label, this.color);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Calculate a reasonable width: 3 items per row with spacing
    final boxWidth = (screenWidth - 40 - 56 - 32) / 3;
    final clampedWidth = boxWidth.clamp(70.0, 120.0);

    return SizedBox(
      width: clampedWidth,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.18)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShaderMask(
              shaderCallback: (b) =>
                  AppTheme.cyanPurpleGradient.createShader(b),
              child: Text(value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800)),
            ),
            const SizedBox(height: 3),
            Text(label,
                textAlign: TextAlign.center,
                style: AppTheme.bodySmall.copyWith(fontSize: 10, height: 1.3)),
          ],
        ),
      ),
    );
  }
}

// Expanded mini stat for desktop Row layout
class _MiniStat extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  const _MiniStat(this.value, this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.18)),
        ),
        child: Column(
          children: [
            ShaderMask(
              shaderCallback: (b) =>
                  AppTheme.cyanPurpleGradient.createShader(b),
              child: Text(value,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800)),
            ),
            const SizedBox(height: 4),
            Text(label,
                textAlign: TextAlign.center,
                style: AppTheme.bodySmall.copyWith(fontSize: 10, height: 1.3)),
          ],
        ),
      ),
    );
  }
}

// ── Expertise Content ───────────────────────────────────────────────────────

class _ExpertiseContent extends StatelessWidget {
  const _ExpertiseContent();

  static const _items = [
    'Advanced Android & iOS development',
    'Firebase & Push Notifications',
    'Complex REST API integration',
    'State management (Provider, BLoC, GetX)',
    'Offline storage (SQLite, Hive)',
    'App Store & Play Console Deployment',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _items
          .map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppTheme.accentPurple.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color:
                                AppTheme.accentPurple.withValues(alpha: 0.35)),
                      ),
                      child: Icon(Icons.check,
                          color: AppTheme.accentPurple, size: 12),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                        child: Text(item,
                            style:
                                AppTheme.bodyLarge.copyWith(height: 1.4, fontSize: 13))),
                  ],
                ),
              ))
          .toList(),
    );
  }
}

// ── Impact Content ──────────────────────────────────────────────────────────

class _ImpactItem {
  final String emoji;
  final String metric;
  final String label;
  const _ImpactItem(this.emoji, this.metric, this.label);
}

class _ImpactContent extends StatelessWidget {
  const _ImpactContent();

  static const _items = [
    _ImpactItem('🚀', '6+', 'Apps live on Google Play'),
    _ImpactItem('⚡', '99.9%', 'Crash-Free User Sessions'),
    _ImpactItem('🏗️', 'Clean', 'Architecture Implementation'),
    _ImpactItem('🔄', 'CI/CD', 'Pipelines with Codemagic'),
    _ImpactItem('📈', 'Enterprise', 'Workflow Automation'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _items
          .map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppTheme.accentCyan.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppTheme.accentCyan.withValues(alpha: 0.2)),
                      ),
                      child: Center(
                          child: Text(item.emoji,
                              style: const TextStyle(fontSize: 16))),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.metric,
                              style: AppTheme.bodyLarge.copyWith(
                                  color: AppTheme.accentCyan,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14)),
                          Text(item.label,
                              style:
                                  AppTheme.bodySmall.copyWith(fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
